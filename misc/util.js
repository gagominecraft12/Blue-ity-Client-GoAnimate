module.exports = {
	xmlFail(message = "Something error occurred. Contact Blue'ity#8383 about this error!") {
		return `<error><code>ERR_ASSET_404</code><message>${message}</message><text></text></error>`;
	},
};
