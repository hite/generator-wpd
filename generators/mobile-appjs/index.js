'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');


var WpdGenerator = yeoman.generators.Base.extend({
    init : function () {
        this.pkg = require('../../package.json');

        this.on('end', function () {
            if (!this.options['skip-install']) {
                this.installDependencies();
            }
        });
    },
    projectfiles : function () {
        this.log('>> create project config.')
        this.copy('editorconfig', '.editorconfig');
        this.copy('jshintrc', '.jshintrc');
    },
    copyMock : function () {
        this.log('>> copy mock files.')
        this.directory('mock/', 'mock/');
    },
    // copy bone files directory
    copyTmpl : function () {
        this.log('>> copy tmpl files.')
        this.directory('tmpl/', 'WEB-INF/tmpl/');
    },
    copyMisc : function () {
        this.log("mkdir('misc')");
        this.mkdir('misc');
        this.directory('misc/', 'misc/');
    },
    copyHTMLDEMO : function () {
        this.directory('html/', 'html/');
    },
    copyStyle : function () {
        this.directory('style/', 'style/')
    },
    copyTest : function () {
        this.log('>> create test files.')
        this.directory('test/', 'test/')
    },
    app : function () {
        this.log('>> create project meta files.')

        this.copy('bower.json', 'bower.json');
        this.copy('package.json', 'package.json');
        this.copy('Gruntfile.js', 'Gruntfile.js');
        //
        this.directory('app/', 'js/app/')
    }
});

module.exports = WpdGenerator;
