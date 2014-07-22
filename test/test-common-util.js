'use strict';
var assert = require('assert');
var util = require('../generators/common/util');

describe('my util works: ', function () {
    it('getLocalIP well ', function () {
        var ip = util.getLocalIP();
        assert(ip.indexOf('.')> 0);// ip should be like '10.240.136.154'
    });
});