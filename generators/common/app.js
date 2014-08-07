'use strict';

function copy(_src, _dest){
    var mFs = require('fs');
    var readStream = mFs.createReadStream(_src);
    var writeStream = mFs.createWriteStream(_dest);
    readStream.pipe(writeStream);
    readStream.on('end', function () {
        console.log('copy end');
    });
    readStream.on('error', function () {
        console.log('copy error');
    });
}

var util = {
    // copy snippets
    importcode : function () {

        var fs = require('fs');
        var pathUtil = require('path');

        var path = null;
        // check os type
        if(process.env.USERPROFILE){// win32
            path = process.env.USERPROFILE + '\\AppData\\Roaming';
        }else{// should be MACos
            path = process.env.home + '/Library/Application Support';// should be Macos
        }
        //check sublimetext version
        if(fs.existsSync(path + '\\Sublime Text 3')){// the higher is  prior
            path = path + '\\Sublime Text 3\\Packages';
        }else if(fs.existsSync(path + '\\Sublime Text 2')){
            path = path + '\\Sublime Text 2\\Packages';
        }
        //
        if(path && !fs.existsSync(path + "\\wpd")){
            fs.mkdirSync(path + "\\wpd");
//            grunt.file.recurse('src/test/snippet/',function(abspath, rootdir, subdir, filename){
//                grunt.file.copy(abspath, path + "\\wpd\\" + filename);
//            });
        }
        var srcPath = '../desktop-basic/templates/code_snippet/WPD-CodeSnippet/'
            fs.readdir(srcPath, function(err, files){
                console.log(files)
                for (var i = 0; i < files.length; i++) {
                    var obj = files[i];
                    copy(pathUtil.join(srcPath,obj), pathUtil.join(path + "\\wpd", obj));
                }
            });
        //
    }
};

util.importcode();
module.exports = util;