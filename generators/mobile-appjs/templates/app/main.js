define(function(require, exports, module){
    /**
    *
    */
    var ajax = require('app/ajax'),
        loading  = $('#js-loading');
    /* in your javascript */
    var app = {
        init : function(){
            App.controller('home', function (page) {
                this.transition = 'swap-left';

                page = $(page);
                // this runs whenever a 'home' page is loaded
                // 'page' is the HTML app-page element
                ajax.get(gContextPath + '/xhr/list.do',{
                    success : function(_data){
                        loading.remove();
                        //
                        var tmpl = page.find('#js-type-list-tmpl').html();
                        var html = '';
                        _.each(_data.list,function(_item, _i){
                            html += _.template(tmpl,_item)
                        });
                        $('.js-tile-list').html(html);
                    }
                })
                // go list page
                $(page).on('singleTap','.js-view-list', function(){
                    var site = $(this);
                    var id = site.attr('data-target-args');
                    var tileName = site.prev().text();
                    App.load('typelist',{tpyeId:id, name : tileName});
                });
            });
            //
            App.controller('typelist',function(_page, _args){
                //
                var page = $(_page);
                page.find('.js-type-title').text(_args.name);
                //
                ajax.get(gContextPath + '/xhr/listtype.do',{
                    data : {typeId: _args.tpyeId},
                    success : function(_data){
                        loading.remove();
                        //
                        var tmpl = page.find('#js-image-list-tmpl').html();
                        var html = '';
                        _.each(_data.list,function(_item, _i){
                            html += _.template(tmpl,_item)
                        });
                        $('.js-image-list').html(html);
                    }
                })
                //
                page.on('singleTap','.js-view-detail',function(){
                    var site = $(this),
                        imageId = site.attr('data-imageid');
                    App.load('detail',{
                        id:imageId, 
                        src : site.attr('src'),
                        typeName : _args.name
                    });
                });
            });
            //
            App.controller('detail',function(_page, _args){
                //
                var page = $(_page);
                
                page.find('.js-detail-title').text('返回到' + _args.typeName);

                page.find('img').attr('src', _args.src);
            });
            //
            App.load('home');
        },
        bindEvents : function(){
        }
    };

    return app;
});