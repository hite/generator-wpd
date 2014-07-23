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
                src: ['js/**/*.js', 'test/**/*.js']
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
        localserver: {
            options: {
                configFile: 'mock/project_config.cfg',
                port: 8081
            }
        },
        open: {
            demo: {
                path: 'http://127.0.0.1:8081/demo',
                app: 'Chrome',
                options: {
                    delay: 2 /* seconds**/
                }
            },
            debug: {
                path: 'http://127.0.0.1:9922/client/#anonymous',
                app: 'Chrome',
                options: {
                    delay: 4 /* seconds**/
                }
            }
        },
        transport: {
            dialog: {
                files: [{
                    cwd: './',
                    expand: true,
                    src: 'app/*.js',
                    filter: 'isFile',
                    dest: 'ts/'
                }]
            }
        },
        concat: {
            dialog: {
                files: {
                    expand: true,
                    cwd: 'ts/',
                    src: ['app/**/*.js'],
                    dest: 'dist',
                    ext: '.js'
                }
            }
        },
        // debug
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
                tasks: ['localserver','weinre'],
                options: {
                    logConcurrentOutput: true,
                    limit : 3
                }
            }
        },
        watch: {
            all: {
                files: ['js/**/*', 'style/**/*', 'WEB-INF/tmpl/**']
            },
            options: {
                livereload: true
            }
        }
    });
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-localserver');
    grunt.loadNpmTasks('grunt-open');
    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-manifest');
    grunt.loadNpmTasks('grunt-cmd-transport');
    // debug
    grunt.loadNpmTasks('grunt-weinre');
    grunt.loadNpmTasks('grunt-concurrent');

    grunt.registerTask('rundemo', ['exec:compilesass', 'open', 'concurrent:dev']);
    grunt.registerTask('build', ['transport']);
    grunt.registerTask('default', ['watch']);
};
