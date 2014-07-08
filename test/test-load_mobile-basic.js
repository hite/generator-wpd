/*global describe, beforeEach, it*/
'use strict';
var assert = require('assert');

describe('wpd generator 6', function () {
  it('can be imported without blowing up', function () {
    var app = require('../generators/mobile-basic');
    assert(app !== undefined);
  });
});
