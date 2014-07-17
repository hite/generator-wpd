/*global module:false*/
module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        // Task configuration.
        jshint: {
            options: {
                curly: true,
                eqeqeq: true,
                immed: true,
                latedef: true,
                newcap: true,
                noarg: true,
                sub: true,
                undef: true,
                unused: true,
                boss: true,
                eqnull: true,
                browser: true,
                globals: {
                    jQuery: true
                }
            },
            gruntfile: {
                src: 'Gruntfile.js'
            },
            lib_test: {
                src: ['lib/**/*.js', 'test/**/*.js']
            }
        },
        qunit: {
            files: ['test/**/*.html']
        },
        freemarker: {
            options: {
                views: 'WEB-INF/tmpl',
                out: 'html'
            },
            src: 'mock/*.js'
        },
        compass: {
            dist: {
                options: {
                    config: './style/config.rb'
                }
            }
        },
        exec: {
            compilesass: {
                command: 'compass compile style/',
                stdout: false,
                stderr: false
            }
        },
        connect: {
            server: {
                options: {
                    port: 8008,
                    hostname: '127.0.0.1',
                    keepalive: true,
                    livereload: false,
                    open: 'http://127.0.0.1:8008/html/html/welcome.html'
                }
            }
        },
        watch: {
            gruntfile: {
                files: '<%= jshint.gruntfile.src %>',
                tasks: ['jshint:gruntfile']
            },
            lib_test: {
                files: '<%= jshint.lib_test.src %>',
                tasks: ['jshint:lib_test', 'qunit']
            }
        }
    });


    grunt.loadNpmTasks('grunt-freemarker');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-exec');
    // Default task.
    grunt.registerTask('default', ['jshint', 'qunit']);
    grunt.registerTask('buildDemo', ['freemarker', 'exec:compilesass', 'connect']);
};
