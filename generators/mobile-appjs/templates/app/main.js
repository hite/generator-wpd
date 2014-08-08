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
                // go list page
                $(page).on('singleTap','.js-view-list', function(){
                    var site = $(this);
                    var id = site.attr('data-target-args');
                    App.load('typelist',{tpyeId:id});
                });
            });
            //
            App.controller('typelist',function(_page, _args){
                //
                var page = $(_page);
                page.on('singleTap','.js-view-detail',function(){
                    var site = $(this),
                        imageId = site.attr('data-imageid');
                    App.load('detail',{id:imageId});
                });
            });
            //

            //
            App.load('home');
        },
        bindEvents : function(){
        }
    };

    return app;
});