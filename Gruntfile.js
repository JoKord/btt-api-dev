"use strict";
module.exports = function(grunt) {

grunt.initConfig({
    bower: {
        dev: {
            base: 'bower_components', /* the path to the bower_components directory */
            dest: 'web/bower_components',
            options: {
                checkExistence: true,
                debugging: true,
                paths: {
                    bowerDirectory: 'bower_components',
                    bowerrc: '.bowerrc',
                    bowerJson: 'bower.json'
                }
            }
        },
        flat: { /* flat folder/file structure */
            dest: 'public/vendor',
            options: {
                debugging: true
            }
        }
    },
    jshint: {
      options: {
        jshintrc: true  
      },
      all: ['Gruntfile.js', 'lib/**/*.js']
    },
    watch: {
      scripts: {
        files: ['lib/app/*.js'],
        tasks: ['jshint'],
        options: {
          spawn: false,
        },
      },
    },
    uglify: {
      my_target: {
        files: [{
          expand: true,
          cwd: 'lib/app/',
          src: '**/*.js',
          dest: 'public/javascript/js'
        }]
      }
    }
});

  grunt.loadNpmTasks('main-bower-files');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  
  // Default task.
  grunt.registerTask('default', ['bower']);
};
