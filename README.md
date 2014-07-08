# generator-wpd [![Build Status](https://secure.travis-ci.org/hite/generator-wpd.png?branch=master)](https://travis-ci.org/hite/generator-wpd)

quick start up to build modern webapp

## Getting Started

 Make sure you have installed [Node.js](http://nodejs.org/) because all tools are based on nodejs to work out. If not ,visit [http://nodejs.org/download/](http://nodejs.org/download/) ,and find out the right version installer accorded with your OS. Install it step by step.

 Assumed that you have Node.js > v0.9.0, some npm packages are also needed.    
 First, you'll need to install `yo` and other required tools.


```bash
$ npm install -g yo
```

If you are using npm 1.2.10 or above, this will also automatically install grunt and bower for you. If you're on an older version of npm, you will need to install them manually:

```bash
\# For npm versions < 1.2.10.
npm install -g grunt-cli bower
```

### what is generator-wpd

Generator-wpd is a project generator for wpd group aimed to quickly set up a new webapp project develop enviroment including css framework, css validation, html scaffolding ,JS util, AMD or CMD modular, UI libary, grunt tasks, delopy tools etc.  
Generator-wpd includes four submodules by now.

+ moible-basic 
+ moible <font color=green>(coming soon)</font>
+ desktop-basic <font color=green>(coming soon)</font>
+ desktop <font color=green>(coming soon)</font>

To install generator-wpd from npm, run:

```bash
$ npm install -g generator-wpd
```

Finally, initiate the generator in some directory your project resides (by now only mobile-basic is available):

```bash
$ yo wpd:mobile-basic
```

And now, you enter into the app directory to start coding. That is fast and esay.
### About generator submodules
> mobile-basic
  
+ Aim at small project which does't have much pages. Such project page also have a simple pageflow , few widgets , basic interaction model
+ technology stack.[zepto.js](http://zeptojs.com/) for DOM\EVENT util instead of jQuery on desktop;         [GMU](http://gmu.baidu.com/) for UI library;[seajs](seajs.org) for module management ; [grunt](http://gruntjs.org) for tasks building;
 
> mobile

+ Aim at bigger project which have some pages. Such project page  have a long pageflow , tabs\pageview\listview widgets using around the app . Due to complex page relationship, MVC structure is the best choice.
+ technology stack.[backbone.js](http://backbonejs.org/) for MVC; Css framework in [{less}](lesscss.org) or [sass](http://sass-lang.com) or [stylus](http://learnboost.github.io/stylus), and make your choice; html scaffolding can be [bootstrap][] or [Intel's App Framework](http://app-framework-software.intel.com/documentation.php) ; [grunt][] or [gulp][] for tasks building; [BEM][] or [wpdcsscode][] for code style

>desktop-basic

+ Aim at bussiness website building
+ technology stack.[jquery][] for DOM\EVENT util ; CSS coding using [WPD Css code style][wpdcsscode];[requirejs](http://requirejs.org) for module management ; [grunt][] for tasks building; [sharkjs][] for UI library;

>desktop

+ Aim at flexiable configure project. use different tools chain in corroding to different bussiness system;
+ technology stack. [bootstrap][] or [foundation5][] for css framework; [wpdcsscode][] or [BEM][] for css code style;[grunt][] or [gulp][] for tasks building; bower for client package management;

## License

MIT

[bootstrap]: getbootstrap.com/2.3.2 'bootstrap offical website'
[grunt]: http://gruntjs.org 'grunt offical website'
[bem]: http://bem.info 
[jquery]: https://jquery.org/
[wpdcsscode]: http://mail.163.com
[sharkjs]: http://sharkjs.org
[foundation5]:http://foundation.zurb.com/develop/download.html
[gulp]:(http://gulpjs.com)