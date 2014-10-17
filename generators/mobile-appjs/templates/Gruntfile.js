/*global module:false*/
module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        jshint: {
            options: {
                jshintrc: true
            },
            gruntfile: {
                src: 'Gruntfile.js'
            },
            lib_test: {
                src: ['app/**/*.js', 'test/**/*.js']
            }
        },
        exec: {
            compilesass: {
                /**https://github.com/hite/generator-wpd/wiki/%E5%A6%82%E4%BD%95%E5%9C%A8sass%E4%B8%AD%E9%85%8D%E7%BD%AE%E4%BD%BF%E7%94%A8autosprite*/
                command: 'chcp 65001 && compass compile style/',
                stdout: false,
                stderr: false
            }
        },
        // deploy
        // Before generating any new files, remove any previously-created files.
        clean: {
            tests: ['dist/*', 'ts/']
        },
        transport: {
            all: {
                files: [{
                    cwd: 'js/',
                    expand: true,
                    src: 'app/**/*.js',
                    filter: 'isFile',
                    dest: 'ts/'
                }]
            }
        },
        // Configuration to be run (and then tested).
        pack_static: {
            custom_options: {
                options: {
                    separator: ';',
                    constVar : {
                        '${jsPath}' : 'ts',
                        '${stylePath}': 'style'
                    }
                },
                files: [{
                    src: 'WEB-INF/tmpl/**/*.ftl'
                }]
            }
        },
        copy: {
            dev: {
                files: [
                    // includes files within path and its sub-directories
                    {
                        src: ['WEB-INF/**','misc/**','style/img/**','misc/**','style/css/**'],
                        dest: 'dist/'
                    }
                ]
            }
        },
        compress: {
            main: {
                options: {
                    archive: 'archive.zip'
                },
                files: [ // includes files in path
                    {
                        src: ['dist/**']
                    }
                ]
            }
        },
        uglify: {
            dev: {
                files: [{
                    expand: true,
                    cwd: 'dist/',
                    src: '*.js',
                    dest: 'dist/static'
                }]
            }
        },
        // debug
        localserver: {
            options: {
                configFile: 'mock/project_config.cfg',
                port: 8081
            }
        },
        open: {
            demo: {
                path: 'http://demo.mail.163.com:8081/',
                app: 'Chrome',
                options: {
                    delay: 2 /* seconds**/
                }
            },
            debug: {
                path: 'http://localhost:9922/client/#anonymous',
                app: 'Chrome',
                options: {
                    delay: 4 /* seconds**/
                }
            }
        },
        weinre: {
            dev: {
                options: {
                    httpPort: 9922,
                    boundHost: '-all-'
                }
            }
        },
        concurrent: {
            dev: {
                tasks: ['localserver', 'weinre'],
                options: {
                    logConcurrentOutput: true,
                    limit: 3
                }
            }
            //        },
            //        watch: {
            //            all: {
            //                files: ['js/**/*', 'style/**/*', 'WEB-INF/tmpl/**']
            //            },
            //            options: {
            //                livereload: true
            //            }
        }
    });
    // load all npm grunt tasks
    require('load-grunt-tasks')(grunt);

    grunt.registerTask('deploy', ['exec:compilesass','transport','copy:dev', 'pack_static', 'uglify', 'compress']);
    grunt.registerTask('rundemo', ['open:demo']);
    grunt.registerTask('debugdemo', ['exec:compilesass', 'open', 'concurrent:dev']);
    grunt.registerTask('default', ['watch']);
};
