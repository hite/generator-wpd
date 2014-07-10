'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');


var WpdGenerator = yeoman.generators.Base.extend({
    init: function() {
        this.pkg = require('../../package.json');

//        this.on('end', function() {
//            if (!this.options['skip-install']) {
//                this.installDependencies();
//            }
//        });
    },

    askFor: function() {
        var done = this.async();

        // Have Yeoman greet the user.
        this.log(yosay('Welcome to the marvelous Wpd generator!'));

        var prompts = [{
            name: 'appName',
            message: 'Would you like to give me your website title ?',
            default: 'netease website wap version'
        }];

        this.prompt(prompts, function (props) {
          this.appName = props.appName;

          done();
        }.bind(this));
    },

    projectfiles: function() {
        this.log('>> create project config.')
        this.copy('editorconfig', '.editorconfig');
        this.copy('jshintrc', '.jshintrc');
    },

    // copy bone files directory
    copyGMU: function() {
        this.log('>> copy tmpl files.')
        this.directory('tmpl/lib','WEB-INF/tmpl/lib/');
        this.copy('tmpl/_main.ftl','WEB-INF/tmpl/main.ftl',{
         appName: this.appName
        });
        this.log("GMU/dist','js//GMU")
        this.directory('GMU/dist/', 'js/GMU/');
        this.log("mkdir('misc')")

        this.mkdir('style');
    },
    copyMisc: function() {
        this.mkdir('misc');
        this.directory('misc/', 'misc/');
    },
    askCSSFrame: function() {
        var done = this.async();

        // Have Yeoman greet the user.
        this.log('choose your css framework. ');

        var prompts = [{
            type: 'input',
            name: 'cssFrame',
            message: 'choose your css framework, Less or SASS or Stylus?',
            default: 'sass'
        }];

        this.prompt(prompts, function(props) {
            this._cssFrame = props.cssFrame;

            done();
        }.bind(this));
    },

    copyStyle: function() {
        var cssFrame = this._cssFrame.toLowerCase();
        if (cssFrame == 'sass') {
          this.directory('style/','style/')
        };
    },
    copyTest : function(){
      this.log('>> create test files.')
      this.directory('test/','test/')
    },
    app: function() {
        this.log('>> create project meta files.')

        this.copy('bower.json', 'bower.json');
        this.copy('package.json', 'package.json',{
          cssFrame: this._cssFrame
        });
        this.copy('Gruntfile.js', 'Gruntfile.js',{
          cssFrame: this._cssFrame
        });
        //
        this.directory('app/','app/')
    },
});

module.exports = WpdGenerator;
