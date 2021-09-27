const voices = require("./info").voices;
const qs = require("querystring");
const brotli = require("brotli");
const https = require("https");
const md5 = require("js-md5");
const http = require("http");

// Fallback option for compatibility between Wrapper and https://github.com/Windows81/Text2Speech-Haxxor-JS.
let get;
try {
	get = require("../misc/get");
} catch {
	get = require("./get");
}

module.exports = (voiceName, text) => {
	return new Promise(async (res, rej) => {
		const voice = voices[voiceName];
		switch (voice.source) {
			case "nextup": {
				https.get("https://nextup.com/ivona/index.html", (r) => {
					var q = qs.encode({
						voice: voice.arg,
						language: `${voice.language}-${voice.country}`,
						text: text,
					});
					var buffers = [];
					https.get(`https://nextup.com/ivona/php/nextup-polly/CreateSpeech/CreateSpeechGet3.php?${q}`, (r) => {
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => {
							const loc = Buffer.concat(buffers).toString();
							if (!loc.startsWith("http")) rej();
							get(loc).then(res).catch(rej);
						});
						r.on("error", rej);
					});
				});
				break;
			}
			case "polly": {
				var buffers = [];
				var req = https.request(
					{
						hostname: "pollyvoices.com",
						port: "443",
						path: "/api/sound/add",
						method: "POST",
						headers: {
							"Content-Type": "application/x-www-form-urlencoded",
						},
					},
					(r) => {
						r.on("data", (b) => buffers.push(b));
						r.on("end", () => {
							var json = JSON.parse(Buffer.concat(buffers));
							if (json.file) get(`https://pollyvoices.com${json.file}`).then(res);
							else rej();
						});
					}
				);
				req.write(qs.encode({ text: text, voice: voice.arg }));
				req.end();
				break;
			}
			case "cepstral":
			case "vocalware": {
				var [eid, lid, vid] = voice.arg;
				var cs = md5(`${eid}${lid}${vid}${text}1mp35883747uetivb9tb8108wfj`);
				var q = qs.encode({
					EID: voice.arg[0],
					LID: voice.arg[1],
					VID: voice.arg[2],
					TXT: text,
					EXT: "mp3",
					IS_UTF8: 1,
					ACC: 5883747,
					cache_flag: 3,
					CS: cs,
				});
				var req = https.get(
					{
						host: "cache-a.oddcast.com",
						path: `/tts/gen.php?${q}`,
						headers: {
							Referer: "https://www.oddcast.com/",
							Origin: "https://www.oddcast.com/",
							"User-Agent":
								"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36",
						},
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => res(Buffer.concat(buffers)));
						r.on("error", rej);
					}
				);
				break;
			}
			case "voicery": {
				var q = qs.encode({
					text: text,
					speaker: voice.arg,
					ssml: text.includes("<"),
					//style: 'default',
				});
				https.get(
					{
						host: "www.voicery.com",
						path: `/api/generate?${q}`,
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => res(Buffer.concat(buffers)));
						r.on("error", rej);
					}
				);
				break;
			}
			case "watson": {
				var q = qs.encode({
					text: text,
					voice: voice.arg,
					download: true,
					accept: "audio/mp3",
				});
				https.get(
					{
						host: "text-to-speech-demo.ng.bluemix.net",
						path: `/api/v1/synthesize?${q}`,
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => res(Buffer.concat(buffers)));
						r.on("error", rej);
					}
				);
				break;
			}
			case "acapela": {
				var q = qs.encode({
					cl_login: "VAAS_MKT",
					req_snd_type: "",
					req_voice: voice.arg,
					cl_app: "seriousbusiness",
					req_text: text,
					cl_pwd: "M5Awq9xu",
				});
				http.get(
					{
						host: "vaassl3.acapela-group.com",
						path: `/Services/AcapelaTV/Synthesizer?${q}`,
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => {
							const html = Buffer.concat(buffers);
							const beg = html.indexOf("&snd_url=") + 9;
							const end = html.indexOf("&", beg);
							const sub = html.subarray(beg + 4, end).toString();
							if (!sub.startsWith("://")) return rej();
							get(`https${sub}`).then(res).catch(rej);
						});
						r.on("error", rej);
					}
				);
				break;
			}
			case "readloud": {
				const req = https.request(
					{
						host: "readloud.net",
						path: voice.arg,
						method: "POST",
						port: "443",
						headers: {
							"Content-Type": "application/x-www-form-urlencoded",
						},
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => {
							const html = Buffer.concat(buffers);
							const beg = html.indexOf("/tmp/");
							const end = html.indexOf(".mp3", beg) + 4;
							const sub = html.subarray(beg, end).toString();
							const loc = `https://readloud.net${sub}`;
							get(loc).then(res).catch(rej);
						});
						r.on("error", rej);
					}
				);
				req.end(
					qs.encode({
						but1: text,
						but: "Enviar",
					})
				);
				break;
			}

			case "voiceforge": {
				/* Special thanks to ItsCrazyScout for helping us find the new VoiceForge link and being kind enough to host xom's VFProxy on his site! */
				var q = qs.encode({
					voice: voice.arg,
					msg: text,
				});
				http.get(
					{
						host: "localhost",
						port: "8181",
						path: `/vfproxy/speech.php?${q}`,
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => res(Buffer.concat(buffers)));
						r.on("error", rej);
					}
				);
				break;
			}

			case "uberduck": {
				http.get(
					{

						host: 'uberduck.ai',
						port: '80',
						path: `#voice=`,
						rhymeWith: 'doButton',
						doButton: `<div style="display:flex;justify-content:center;align-items:center"><button type="button" class="btn btn-primary">Synthesize</button></div>`,
						/* Also that uberduck does their api to use "GET" but i put it to "POST" -Blue'ity */
						method: "POST",
						headers: {
							'content-type': 'text/wav',
							"accept-encoding": "node, gzip, hastagAPI",
							Origin: 'https://api.uberduck.ai/speak',
							Referer: 'https://api.uberduck.ai/speak?DISCORDAPI=ROLE,ADMIN?ADMIN=TRUE',
														/*referer: "https://api.uberduck.ai/speak",*/

							/* 
							THE UNUSED VERSION WHICH WILL BE A ERROR.
							     origin: "https://uberduck.ai", */
							/*
							*
							It says that would having access with the Uberduck API does not have access with guests or members.
							It could not be found if you have have admin access.
							THE ERROR CODE WOULD SAY: {"detail":"Method Not Allowed"} "Method Not Allowed" if you have your role Member or Guest. YOU NEED TO BE A ADMIN OR DEVELOPER OF THIS SITE IF RECOMMENDED
							*/

							/*
							    Atleast i fixed this using Discord API for HTML Business
							*/
							discBotID: "https://discord.com/oauth2/authorize?client_id=799791375431499799&permissions=2148352&scope=bot%20applications.commands",
							discbotID: "79979137543149979",

							/* 
							Also to do with the website called "https://api.uberduck.ai/speak" I USE THE UBERDUCK API. I DO NOT OWN UBERDUCK
							*/
							requestUrl: {
								request: "https://api-js.mixpanel.com/track/?verbose=1&ip=1&_=1631924491124",

								strictJS: "https://browser.sentry-cdn.com/6.2.2/bundle.min.js",

								strictJS: "https://uberduck.ai/_next/static/chunks/0cf71672.68042a0cfbc90420d3c7.js",

								request: "https://api.uberduck.ai/speak-status?uuid=",
							},

							websiteCookie: {
								website: "https://api.uberduck.ai",
							}

							
							
						}
					},
				);
				break;
			}
			
			case "cereproc": {
				const req = https.request(
					{
						hostname: "www.cereproc.com",
						path: "/themes/benchpress/livedemo.php",
						method: "POST",
						headers: {
							"content-type": "text/xml",
							"accept-encoding": "gzip, deflate, br",
							origin: "https://www.cereproc.com",
							referer: "https://www.cereproc.com/en/products/voices",
							"x-requested-with": "XMLHttpRequest",
							cookie: "Drupal.visitor.liveDemo=666",
						},
					},
					(r) => {
						var buffers = [];
						r.on("data", (d) => buffers.push(d));
						r.on("end", () => {
							const xml = String.fromCharCode.apply(null, brotli.decompress(Buffer.concat(buffers)));
							const beg = xml.indexOf("https://cerevoice.s3.amazonaws.com/");
							const end = xml.indexOf(".mp3", beg) + 4;
							const loc = xml.substr(beg, end - beg).toString();
							get(loc).then(res).catch(rej);
						});
						r.on("error", rej);
					}
				);
				req.end(
					`<speakExtended key='666'><voice>${voice.arg}</voice><text>${text}</text><audioFormat>mp3</audioFormat></speakExtended>`
				);
				break;
			}
		}
	});
};