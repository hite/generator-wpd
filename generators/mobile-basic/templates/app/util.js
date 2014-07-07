define(function(require, exports, module){
    // util
    /**
     * 用来判断是否可以支持预览
     * @type {object}
     */
    
    var brower = 'others';// 修正不同浏览器想诡异的行为

    if(/UCBrowser/ig.test(window.navigator.userAgent)){
      brower = 'ucbrowser';
    }else if(/360browser/ig.test(window.navigator.userAgent)){
      brower = '360browser';
    }
    //
    var tools = {
	    width : window.innerWidth,
	    height : window.innerHeight,
      getBrower : function(){
        return brower
      },
      /**
     * 格式化时间
     * @param {number or date} value  时间
     * @param {string} fmt 格式
     */
    formatDate: function(value, fmt){
        if (typeof(value) == "number" || typeof(value) == "string") 
            value = new Date(value);
        var o = {
            "y+": value.getFullYear(), // 年份      
            "M+": value.getMonth() + 1, //月份        
            "d+": value.getDate(), //日        
            "h+": value.getHours() % 12 == 0 ? 12 : value.getHours() % 12, //小时        
            "H+": value.getHours(), //小时        
            "m+": value.getMinutes(), //分        
            "s+": value.getSeconds(), //秒        
            //"q+" : Math.floor((value.getMonth()+3)/3), //季度        
            "S": value.getMilliseconds() //毫秒        
        };
        var week = {
            "0": "\u65e5",
            "1": "\u4e00",
            "2": "\u4e8c",
            "3": "\u4e09",
            "4": "\u56db",
            "5": "\u4e94",
            "6": "\u516d"
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (value.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[value.getDay() + ""]);
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    },
		  getFileExt : function(_fileName){
	        var parts = _fileName.split('.');
          if(parts.length<2){
            return '';
          }
	        return parts[parts.length-1].toLowerCase();
	    },
      getFileSizeTxt : function(_filesize){
        var filesizeTxt = '';
        if(_filesize == 0) return filesizeTxt;
        //最多保留小数点后面2位
        _filesize = _filesize *100;//不使用tofixed的方式
        if(_filesize<1024*100){
            filesizeTxt = Math.round(_filesize)/100 + 'B';
        }else if(_filesize< 1024*1024*100){
            filesizeTxt = Math.round(_filesize/1024)/100 + 'K';
        }else if(_filesize< 1024*1024*1024*100){
            filesizeTxt = Math.round(_filesize/1024/1024)/100 + 'M';
        }else{
            filesizeTxt = Math.round(_filesize/1024/1024/1024)/100 + 'G';
        }
        return filesizeTxt;
      },
       /**
       * 为_baseUrl追加某些参数，自动判断处理"？"
       * @example
       * .appendURL("hite.me",{a:2,c:3,d:4});
       *
       * @author  hite
       * @version 1.0
       * @date    2012-3-27
       * @param   {string}  _baseUrl  基础的url
       * @param   {object}  _optional 参数和参数值对的对象
       * @return  {string}            追加了参数的新url字符串
       */
      appendURL: function(_baseUrl, _optional){
          var baseURL = _baseUrl||"";
        if(!_optional) {
          return baseURL;
        }
        
          var url = baseURL.split("?");
          var result = url[0] + "?" + $.param(_optional, true);
          if (url.length == 2) {
              result = result + "&" + url[1];
          }
          return result.replace(/&+/gm, "&");
      }
    };
    //
    tools.fixIframeHeight = function(_iframe, _withWidth){
        var oIfrm= _iframe;
        if(oIfrm && oIfrm.contentWindow && oIfrm.contentWindow.document){
            var oDoc = oIfrm.contentWindow.document;

            //有时候会出现oDoc.body取不到的情况
            if(!oDoc || !oDoc.body){
                return;
            }

             // 先尝试获取body的高度
            var nBodyHeight = Math.max(oDoc.body.scrollHeight,oDoc.body.offsetHeight);
            // 在尝试使用html的高度，有些内容部正规，quirk
            var nHtmlHeight = Math.max(oDoc.body.parentNode.scrollHeight , oDoc.body.parentNode.offsetHeight);
            var maxHeight = Math.max(nBodyHeight,nHtmlHeight);
            // 20 为了调整页面过长时出现双滚动条的问题
            if(($(oIfrm).height()-maxHeight<0)){
                oIfrm.style.height = maxHeight + 20 + "px";
            }
            //
            if(_withWidth){
              // 先尝试获取body的高度
              var nBodyWidth = Math.max(oDoc.body.scrollWidth,oDoc.body.offsetWidth);
              // 在尝试使用html的高度，有些内容部正规，quirk
              var nHtmlWidth = Math.max(oDoc.body.parentNode.scrollWidth , oDoc.body.parentNode.offsetWidth);
              var maxWidth = Math.max(nBodyWidth,nHtmlWidth);
              // 20 为了调整页面过长时出现双滚动条的问题
              if(($(oIfrm).width()-maxWidth<0)){
                  oIfrm.style.width = maxWidth + "px";
              }
            }

            //为了解决某些邮件内容里table height 100% + 统计图片也有高度 导致出现双滚动条的情况
            //这个阈值是根据已有的邮件用例定的，比如Leap, Path的直邮，如果高度相差在2px以内，直接强制隐藏
            //IE浏览器下不作处理
            if($(oIfrm).height() - $(oDoc).height() < 2){
                $(oDoc.body).css('overflow-y','hidden');
            }else{
                $(oDoc.body).css('overflow-y','auto');
            }
        }
    };
    tools.pinchAndMove = function(_container, _selector){
        var targetSelector = _selector;
        var historyScale = 1, historyTranslate = {}, startTranslate = {};
        var gestureStartFunc = function(e){
            var lastScale = $(this).data('_global_last_scale');
            if(lastScale){
              historyScale = parseFloat(lastScale);
            }else{
              historyScale = 1;
            }
            console.log('lastScale');
            console.log(lastScale);
          },
          gestureChangeFunc =  function(e){
            console.log('change');
            var site = $(this);
            var scale = e.scale * historyScale;
            console.log(e.scale);
            console.log(historyScale);
            site.animate({
              'scale': scale+','+scale
            }, 100, 'ease-out');
            // console.log('width: ' + site.width())
          },
          gestureEndFunc = function(e){
            console.log('end');
            console.log(e.scale);
            console.log(historyScale);
            var currentScale = e.scale * historyScale;
            if(currentScale<=1){
              currentScale = 1;
              $(this).animate({
                'scale': '1,1'
              }, 1500, 'ease-out');
            }
            $(this).data('_global_last_scale',currentScale);
            historyScale = currentScale;
          },
          doubleTapFunc = function(){// 双击还原
            var lastScale = $(this).data('_global_last_scale');
            if(lastScale){
              // lastScale = parseFloat(lastScale);
              if(lastScale > 1){
                $(this).animate({
                  'scale': '1,1'
                }, 500, 'ease-out');
                //
                $(this).data('_global_last_scale',1);
              }
            }
          },
          touchStartFunc = function(_evt){// 拖动事件
            var site = $(this);
            var lastScale = site.data('_global_last_scale');
            // gesture的结尾有可能触发 touchend事件，要避免无头的touch事件；
            if(lastScale > 1 && _evt.touches.length ==1 ){
              // console.log('iam touchstart')

              site.data('_global_touch_started',true);

              var lastTranslate = site.data('_global_last_translate');
              if(lastTranslate){
                historyTranslate = lastTranslate;
              }else{
                historyTranslate = {x:0,y:0};
              }
              //
              // console.log('historyTranslate');
              // console.log(historyTranslate)
              var touch = _evt.touches[0];
              startTranslate.x = touch.pageX;
              startTranslate.y = touch.pageY;
              return true;
            }
          },
          touchMoveFunc = function(_evt){
            var site = $(this);
            var lastScale = site.data('_global_last_scale');
            if(lastScale > 1 && site.data('_global_touch_started')){
              console.log('iam touchmove')
              var touch = _evt.changedTouches[0];
              var currentClient = {};
              currentClient.x = touch.pageX-startTranslate.x+historyTranslate.x;
              currentClient.y = touch.pageY-startTranslate.y+historyTranslate.y;
              //
              console.log('currentClient')
              console.log(currentClient);
              site.animate({
                'translate': (currentClient.x) +'px,'+(currentClient.y)+'px'
              }, 500, 'ease-out');
            }
          },
          touchEndFunc = function(_evt){
              var site = $(this);
              var lastScale = site.data('_global_last_scale');
              // gesture的时候也会触发 touch
              if(lastScale > 1 && site.data('_global_touch_started') ){
              console.log('iam touchend')
                var touch = _evt.changedTouches[0];
                var currentClient = {};
                currentClient.x = touch.pageX;
                currentClient.y = touch.pageY;
                //
                site.data('_global_last_translate',{
                  x : currentClient.x-startTranslate.x+historyTranslate.x,
                  y : currentClient.y-startTranslate.y+historyTranslate.y
                });
                console.log(site.data('_global_last_translate'));
              }
              site.data('_global_touch_started',false);
            };
          if(targetSelector){
              $(_container).on('gesturestart',targetSelector, gestureStartFunc)
                .on('gesturechange',targetSelector,gestureChangeFunc)
                .on('gestureend',targetSelector, gestureEndFunc)
                .on('doubleTap',targetSelector,doubleTapFunc)
                .on('touchstart',targetSelector,touchStartFunc)
                .on('touchmove',targetSelector,touchMoveFunc)
                .on('touchend',targetSelector,touchEndFunc);
          }else{
            $(_container).on('gesturestart', gestureStartFunc)
                .on('gesturechange',gestureChangeFunc)
                .on('gestureend', gestureEndFunc);
          }
        
    };

    tools.scrollify = function(_container, _optional){
      var scrollDefault = {
        isX : true,// horizontal
        isY : false, // vertical
        dragableSelector: 'ul',
        moveDelay : 0,
        monitorSelector : 'li'
      };
      var optional = $.extend(scrollDefault, _optional);

      var before = optional.before,
        moving =  optional.moving,
        after =  optional.after,
        dragableSelector = optional.dragableSelector,
        monitorSelector = optional.monitorSelector;

        // 拖动滚动条
        // via http://hi.baidu.com/alimyself/item/ac47c3a491ccb6d15bf19187
        var lastClient = null,
        clientOffset = {// 历史上累计的偏移
            x:0,
            y:0
        },
        currentOffset = {x:0,y:0};
        //
        var imgViewer = _container;
        imgViewer.on('touchstart',monitorSelector,function(_evt){
            if(before && before()=== true){
              return true;
            }
            //
            console.log('wtf-touchstart');
            var touch = _evt.touches[0];
            lastClient = {};
            lastClient.x = touch.clientX;
            lastClient.y = touch.clientY;
            return true;
        });

        imgViewer.on('touchend',monitorSelector,function(_evt){
            if(after && after()=== true){
              return true;
            }
console.log('wtf-touchend');
            clientOffset.x = currentOffset.x;
            clientOffset.y = currentOffset.y;
            // 
            lastClient = null;
            return true;
        });
        
        imgViewer.on('touchmove',monitorSelector,function(_evt){
            if(moving && moving()=== true){
              return true;
            }
            console.log('wtf-touchmove');
            var type = _evt.type;
            var client = {};
            var touch = _evt.changedTouches[0];
            client.x = touch.clientX;
            client.y = touch.clientY;
            //
            currentOffset.x = client.x-lastClient.x + clientOffset.x;
            currentOffset.y = client.y-lastClient.y + clientOffset.y;
            //
            // console.log(offsetTranslation);
            imgViewer.find(dragableSelector).animate({
              'translate3d':  (optional.isX?currentOffset.x+'px':'0')+','+ (optional.isY?currentOffset.y+'px':'0') +',0' 
            }, optional.moveDelay, 'linear');

            if(optional.onmove){
              optional.onmove(this);
            }
            //

            return true;
        });  

        return {
          // 其他操作也会影响 _container的滚动，需要设置获取到他
          updateClientOffset : function(_callback){
            if(_callback){
              _callback(clientOffset);
            }
          }
        };
    }

    module.exports = tools;
});