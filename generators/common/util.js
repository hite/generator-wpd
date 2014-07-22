'use strict';
var os = require('os');

var util = {
    getLocalIP : function () {
        var ifaces = os.networkInterfaces();
        var ipList = ifaces['本地连接'] || ifaces['LOCALE NETWORK'] || [];
        var ip = '127.0.0.1';
        for(var i = 0, len = ipList.length; i< len; i++){
            var item = ipList[i];
            if(item.family.toLowerCase() === 'ipv4'){
                ip = item.address;
                break;
            }
        }
        return ip;
    }
};

module.exports = util;