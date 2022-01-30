var Widgetbot;
(function (Widgetbot) {
    //Config for ElementIds
    var Config = {
        Widgetbot: "widgetbot"
    };

    //Show Widgetbot
    Widgetbot.show = function (ServerId,ChannelId) {
        var Html = Widgetbot.getHtml(ServerId,ChannelId);
        $navControlContainer.append(Html);
    }

    //Remove Widgetbot
    Widgetbot.remove = function () {
        deleteID(Config.Widgetbot);
    }

    //Get HTML-Content for "Widgetbot"
    Widgetbot.getHtml = function (ServerId,ChannelId) {
        var Html = '';
        Html += '<widgetbot id="widgetbot" server="'+ ServerId +'" channel="' + ChannelId +'" width="100%" height="98%"></widgetbot>';
        Html += '<script src="https://cdn.jsdelivr.net/npm/@widgetbot/html-embed"></script>';
        return Html;
    }
})(Widgetbot || (Widgetbot = {}));

