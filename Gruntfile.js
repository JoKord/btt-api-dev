'use strict';

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
      }
  });

  grunt.loadNpmTasks('main-bower-files');

  // Default task.
  grunt.registerTask('default', ['bower']);
};
