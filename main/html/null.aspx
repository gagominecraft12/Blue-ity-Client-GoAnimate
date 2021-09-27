<title>starter save</title>



<body>
    <html>
        <div>
            <box>
                <p>Are you sure to save the starter?</p>
                <button>
                    Yes
                </button>
                <button>
                    No
                </button> 

                <previewPlayer>
                    <div class="close"><a href="javascript:playerdiv()" onclick="javascript:return playerdiv()">Enter The Player</a></div>
                </previewPlayer>
                
                <br>
            
                <br>
            
                    <img src="localhost:5025/_SAVED/thumb-{0:d7}.png" width="450" height="240">

                    swfData()
                    
                    <br>

                </div>
                <div id="studio_holder" style="width: 2108px;"><object data="https://d3v4eglovri8yt.cloudfront.net/animation/66453a3ba2cc5e1b/go_full.swf" type="application/x-shockwave-flash" id="Studio" width="100%" height="100%"><param name="align" value="middle"><param name="allowScriptAccess" value="always"><param name="allowFullScreen" value="true"><param name="wmode" value="window"><param name="flashvars" value="movieId=&amp;loadas=0&amp;asId=&amp;originalId=&amp;apiserver=https%3A%2F%2Fga.vyond.com%2F&amp;storePath=https%3A%2F%2Fd3v4eglovri8yt.cloudfront.net%2Fstore%2F3a981f5cb2739137%2F%3Cstore%3E&amp;clientThemePath=https%3A%2F%2Fd3v4eglovri8yt.cloudfront.net%2Fstatic%2F019b83797158fc0c%2F%3Cclient_theme%3E&amp;animationPath=https%3A%2F%2Fd3v4eglovri8yt.cloudfront.net%2Fanimation%2F66453a3ba2cc5e1b%2F&amp;userId=0cf4CMw1ZNCk&amp;username=bakeryb40488&amp;uemail=bakeryb40488%40gmail.com&amp;numContact=0&amp;ut=23&amp;ve=false&amp;isEmbed=0&amp;nextUrl=%2Fgo%2FsavedMovie%2F%3CmovieId%3E%2F0%2F1&amp;bgload=https%3A%2F%2Fd3v4eglovri8yt.cloudfront.net%2Fanimation%2F66453a3ba2cc5e1b%2Fgo_full.swf&amp;lid=0&amp;ctc=go&amp;themeColor=silver&amp;tlang=en_US&amp;siteId=13&amp;templateshow=false&amp;forceshow=false&amp;appCode=go&amp;lang=en&amp;tmcc=4048901&amp;fb_app_url=https%3A%2F%2Fga.vyond.com%2F&amp;is_published=0&amp;is_private_shared=1&amp;is_password_protected=false&amp;upl=1&amp;hb=1&amp;pts=1&amp;msg_index=&amp;ad=0&amp;has_asset_bg=1&amp;has_asset_char=0&amp;initcb=studioLoaded&amp;retut=0&amp;&amp;s3base=https%3A%2F%2Fs3.amazonaws.com%2Ffs.goanimate.com%2F%2Chttps%3A%2F%2Fassets.vyond.com%2F&amp;st=&amp;uisa=0&amp;u_info=OjI6elg5SnZCOUEyTHZiY2lhZGRXTm9Nd0ljVWhNbEpGaXJFdkpEdkltdEp6RWhrQ0VIbXZIVTBjRTlhUGZKMjJoVHVTUE5vZk1XYnFtSE1vZG5TeldyQVJNcDFmUFB2NDVtR0FTSlZZ&amp;tm=FIN&amp;tray=business&amp;isWide=1&amp;newusr=1&amp;goteam_draft_only=0"><param name="movie" value="https://d3v4eglovri8yt.cloudfront.net/animation/66453a3ba2cc5e1b/go_full.swf"></object></div>
                <script>
                    function checkPreviewServer() {
    return previewPlayer._connectionState === PreviewPlayerConstants.STATE_READY;
}

function loadH5Preview() {
    if (filmXmlStr === null) {
        return;
    }

    $('#h5-playerdiv').data('previewPlayerControl').reset();
    previewPlayer.preview(filmXmlStr, previewStartFrame);
    $('#previewPlayer').addClass('using-h5');
}

function loadLegacyPreview() {
    if (movieDataXmlStr === null) {
        return;
    }

    pauseH5PreviewPlayer();

    savePreviewData(movieDataXmlStr);
    createPreviewPlayer("playerdiv", {
        height: 360,
        width: 640,
        player_url: "https://d3v4eglovri8yt.cloudfront.net/animation/66453a3ba2cc5e1b/player.swf",
        quality: "high"
    }, {
        movieOwner: "", movieOwnerId: "", movieId: "", ut: "-1",
        movieLid: "8", movieTitle: "", movieDesc: "", userId: "", username: "", uemail: "",
        apiserver: "https://ga.vyond.com/", thumbnailURL: "", copyable: "0", isPublished: "0", ctc: "go", tlang: "en_US", is_private_shared: "0",
        autostart: "1", appCode: "go", is_slideshow: "0", originalId: "0", is_emessage: "0", isEmbed: "0", refuser: "",
        utm_source: "", uid: "", isTemplate: "1", showButtons: "0", chain_mids: "", showshare: "0", averageRating: "",
                    s3base: "https://s3.amazonaws.com/fs.goanimate.com/,https://assets.vyond.com/",
                ratingCount: "", fb_app_url: "https://ga.vyond.com/", numContact: 0, isInitFromExternal: 1, storePath: "https://d3v4eglovri8yt.cloudfront.net/store/3a981f5cb2739137/<store>", clientThemePath: "https://d3v4eglovri8yt.cloudfront.net/static/019b83797158fc0c/<client_theme>", animationPath: "https://d3v4eglovri8yt.cloudfront.net/animation/66453a3ba2cc5e1b/",
        startFrame: previewStartFrame
    });
    $('#previewPlayer').removeClass('using-h5');
}
                </script>   

    </script>

    <script id="swfData"></script>

    <div id="previewPlayerContainer" style="display: none;">
        <div class="preview-player" id="previewPlayer">
            <h2>Preview Video</h2>
            <div id="playerdiv"></div>
            <div id="h5-playerdiv">
                <video class="hidden" id="h5-preview-player" width="100%" height="100%"></video>
                <div class="player-overlay loading">
                    <div class="loading-icon">
                        <div class="loading-message"></div>
                    </div>
                    <div class="replay-button"></div>
                </div>
                <div class="video-controls">
                    <div class="playback-button">
                        <div class="icon-image"></div>
                    </div>
                    <div class="seek-bar">
                        <div class="value-bar total-bar"></div>
                        <div class="value-bar buffered-bar"></div>
                        <div class="value-bar played-bar"></div>
                        <div class="slider-thumb"></div>
                        <div class="time-tooltip">00:00</div>
                    </div>
                    <div class="time-display">
                        <div class="text">00:00 / 00:00</div>
                    </div>
                    <div class="volume-control">
                        <div class="volume-icon">
                            <div class="icon-image"></div>
                        </div>
                        <div class="volume-slider">
                            <div class="slider-track">
                                <div class="track-value-bar"></div>
                            </div>
                            <div class="slider-thumb"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="preview-alert-block" class="preview-alert-block clearfix">Auto-pause at end of scenes is not supported in our web video player.<br>The auto-pause feature is supported once you download the video as presentation in the "Share/Export" overlay.</div>
            <div class="buttons clearfix">
                <button class="preview-button edit" type="button" onclick="switchBackToStudio();">Back to editing</button>
                <button class="preview-button save" type="button" onclick="publishStudio();">Save Now</button>            </div>

            <a class="close_btn" href="#" onclick="switchBackToStudio(); return false;">×</a>
        </div>
    </div>

    <style>
        p {
            color: white;
            font-family: Allan;
            font-size:xx-large
        }

        box {
            background-color: rgb(66, 66, 66);
            background-size: xx;
        }

        body {
            background-color: black;
        }

        button {
            background-color:gray;

            color: darkgray;

            flex: none;
        }

        img {
            background-color:grey;
            background-image: "localhost:5025/_SAVED/thumb-{0:d7}.png";
        }
        
        caption {
            color: white;
            font-family: Arial;
        }
    </style>
</body>