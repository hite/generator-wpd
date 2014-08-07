define(function(require, exports, module){
    /**
     *
     */
    /* in your javascript */
    var app = {
        init : function(){
            App.controller('home', function (page) {
                // this runs whenever a 'home' page is loaded
                // 'page' is the HTML app-page element
                $(page)
                    .find('.app-button')
                    .on('click', function () {
                        App.dialog({
                            title        : '通知',
                            text         : 'Can I help you, sir? ',
                            okButton     : 'Yes, you can',
                            cancelButton : 'pissoff'
                        }, function (tryAgain) {
                            if (tryAgain) {
                                // try again
                            }
                        });
                    });
            });
            //
            App.load('home');
        },
        bindEvents : function(){
        }
    };

    return app;
});