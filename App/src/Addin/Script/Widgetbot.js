var Widgetbot;
(function (Widgetbot) {
    //Config for ElementIds
    var Config = {
        Widgetbot: "widgetbot"
    };

    //Show Widgetbot
    Widgetbot.show = function (Setup) {
        var Html = Widgetbot.getHtml(Setup);
        $navControlContainer.append(Html);
    }

    //Remove Widgetbot
    Widgetbot.remove = function () {
        deleteID(Config.Widgetbot);
    }

    //Get HTML-Content for "Widgetbot"
    Widgetbot.getHtml = function (Setup) {
        var Html = '';
        Html += '<widgetbot id="widgetbot" server="'+ Setup.serverid +'" channel="' + Setup.channelid +'" width="'+ Setup.width +'" height="'+ Setup.height + '"></widgetbot>';
        Html += '<script src="https://cdn.jsdelivr.net/npm/@widgetbot/html-embed"></script>';
        return Html;
    }
})(Widgetbot || (Widgetbot = {}));

