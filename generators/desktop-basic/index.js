'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');


var WpdGenerator = yeoman.generators.Base.extend({
    init: function() {
        this.pkg = require('../../package.json');

        this.on('end', function() {
            if (!this.options['skip-install']) {
                this.installDependencies();
            }
        });
    },

    greet: function() {
        // Have Yeoman greet the user.
        this.log(yosay('Welcome to the marvelous Wpd generator!'));
    },

    projectfiles: function() {
        this.log('>> create project config.')
//        this.copy('editorconfig', '.editorconfig');
        this.copy('jshintrc', '.jshintrc');
    },

    // copy static files or demo files
    copyHTML: function() {
        this.log('>> copy static files.')
        this.log('>> copy mock files.')
        this.directory('mock/','mock/');
        this.log('>> create demo files derived from ftl files.')
        this.directory('html/','html/');
    },
    copyJS: function() {
        this.directory('js/', 'js/');
    },
    copyMisc: function() {
        this.directory('misc/', 'misc/');
    },
    copyStyle: function() {
        this.directory('style/', 'style/');
    },
    _copyTest : function(){
      this.log('>> create test files.')
      this.directory('test/','test/');
    },
    copyTmpl : function(){
        this.log('>> create templates files.')
        this.directory('tmpl/','WEB-INF/tmpl')
    },
    app: function() {
        this.log('>> create project meta files.')

        this.copy('bower.json', 'bower.json');
        this.copy('package.json', 'package.json');
        this.copy('Gruntfile.js', 'Gruntfile.js');
        //
        this.copy('favicon.ico','favicon.ico');
    }
});

module.exports = WpdGenerator;
