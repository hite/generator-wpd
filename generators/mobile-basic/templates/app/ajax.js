define(function(require, exports, module){
    /**
    *
    * 增加相同请求的排队功能,防止重复提交。典型场景是在预取分页的地方；
    */
    var queue = {};// 注意膨胀的问题
    exports.bjax = function(_url,_options){
        var queueID = _options.queueID;
        if(queueID){
            if(queue[queueID]) return ;

            queue[queueID] =  true;
        }
        //
        var tmp = _options.success;
        var options = {
            url : _url,
            success: function(_args) {
                if(_args.code == 'SC_OK'){
                    tmp(_args.data);
                }else{
                    alert(_args.msg || '服务器出错了');
                }
                //
                if(queueID){
                    queue[queueID] = false;
                }
            }
        };
        delete _options.success;
        $.extend(options,_options);

        $.ajax(options);
    };
});