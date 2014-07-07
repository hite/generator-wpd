/*global module:false*/
module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

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
        watch: {
            all: {
                files: ['../js/**/*', '../style/**/*', '../WEB-INF/tmpl/**']
            },
            options: {
                livereload: true
            }
        }
    });
    <% if(_cssFrame == 'stylus'){%>
      grunt.loadNpmTasks('grunt-contrib-stylus');
    <%}else if(_cssFrame == 'less'){%>
      grunt.loadNpmTasks('grunt-contrib-less');
    <%}%>
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-manifest');
    grunt.loadNpmTasks('grunt-cmd-transport');

    grunt.registerTask('build', ['transport']);
    grunt.registerTask('default', ['watch']);
};
