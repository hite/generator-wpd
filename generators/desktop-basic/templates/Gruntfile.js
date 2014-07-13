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
         options:{
             views:'tmpl',
             out:'html'
         },
        src : 'mock/*.js'
     },
      sass: {
          dist: {
              files: [{
                  expand: true,
                  cwd: 'style/scss',
                  src: ['*.scss'],
                  dest: 'style/css',
                  ext: '.css'
              }]
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

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-freemarker');
  // Default task.
  grunt.registerTask('default', ['jshint', 'qunit']);
  grunt.registerTask('parseFtl', ['freemarker']);
    grunt.loadNpmTasks('grunt-contrib-sass');

};
