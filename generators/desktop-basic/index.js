'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');
var spawn = require('child_process').spawn;
var chalk = require('chalk');
var info = chalk.bold.bgYellow;

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
        this.directory('html/','html/');
        this.log('>> copy mock files.')
        this.directory('mock/','mock/');
    },
    copyJS: function() {
        this.directory('js/', 'js/');
    },
    copyMisc: function() {
        this.directory('misc/', 'misc/');
    },
    copyStyle: function() {
        var error = chalk.bold.yellow;
        this.log(error('Ruby and Compass are required to run scss compile . ' +
            'see more information at http://www.tuicool.com/articles/FF7fEv '));
        var recc = chalk.bold.green;

        this.log(recc('ruby 2.0.0p481 is recommended, and ruby 1.9.2 doesn\'t work well.'));
        this.directory('style/', 'style/');
    },
    installDevTool : function(){
        var asyn = this.async();
        this.log('The following tools or extension for chrome is helpful to higher productiveness.');
        this.log(info('xPath-finder,a chrome extension to find DOM using xpath language.'));
        var prompts = [{
            type: 'confirm',
            name: 'xpathfinder',
            message: 'Do you like to install xpathfinder extension ?',
            default: false
        }];

        this.prompt(prompts, function (answers) {
            this._install_xpathfinder = answers.xpathfinder?
                'https://chrome.google.com/webstore/detail/xpath-finder/ijaobnmmgonppmablhldddpfmgpklbfh/reviews':'';
            this.log('please visit '+
                chalk.magenta(this._install_xpathfinder) +
                ' in browser, and follow the step to install ');
            asyn();
        }.bind(this));
        //

    },
    installRuby : function(){
        var asyn = this.async();
        this.log(info('ruby, you must has ruby run-time enviroment before using sass and compass.'));
        var prompts = [{
            type: 'confirm',
            name: 'ruby',
            message: 'Do you like to install ruby enviroment ?',
            default: false
        }];
        this.prompt(prompts, function (answers) {
            this._install_ruby = answers.ruby?
                'http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe?direct':'';
            this.log('please visit '+
                chalk.magenta(this._install_ruby) +
                ' in browser, and follow the step to install ');
            asyn();
        }.bind(this));
    },
    installCompass : function(){
        var asyn = this.async();
        this.log(info('Compass, Compass is an open-source CSS Authoring Framework.Compass uses Sass.' +
            'if you want autosprite function in scss, you should install this. '));
        var prompts = [{
            type: 'confirm',
            name: 'compass',
            message: 'Do you like to install Compass ?',
            default: false
        }];
        this.prompt(prompts, function (answers) {
            if(answers.compass){
                this.log('please run '+
                    chalk.magenta('gem install compass') +
                    ' in cmd, then sass and compass are both installed ')
            }
            asyn();
        }.bind(this));
    },
    copyCodeSnippet : function(){
        var that = this;
        function installSnippet(_ide){
            that.log('>> install code snippet for ' + _ide + '.')
            //TODO generate such files from url, for example http://css-tricks.com/snippets/
            that.mkdir('code_snippet');
            if(_ide == 'webstorm'){
                that.directory('code_snippet/settings','code_snippet/settings')
                that.log('jar settings folder to settings.jar, and import settings into WebStrom ')
            }else{
                that.directory('code_snippet/WPD-CodeSnippet','code_snippet/WPD-CodeSnippet')
                that.log(' After scaffolding is completed ,run `grunt importcode` tast');
            }
        }
        var asyn = this.async();
        this.log(info('Code Snippet is set of most used code segment.' +
            'You can quickly input a bunch of code segment using Code Snippet'));
        var prompts = [{
            name: 'ide',
            message: 'which editor do you like to install in, WebStorm or SublimeText3 ?',
            default: 'webstrom'
        }];
        this.prompt(prompts, function (answers) {
            var ide = answers.ide.toLowerCase();
            installSnippet(ide);
            asyn();
        }.bind(this));
    },
    copyTest : function(){
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
