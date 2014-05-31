var csspaths = ["_scss/*.scss"];

module.exports = function(grunt) {

  grunt.initConfig({

    watch: {      
      scss:{
        files: csspaths,
        tasks:['compass:development']
      },
    },

    compass: {
      development: { 
        options: {
          sassDir: '_scss',
          cssDir: 'css',
          environment: 'development',
          force: true
        }
      },
      production: {
        options: {
          sassDir: '_scss',
          cssDir: 'css',
          environment: 'production',
          outputStyle: 'compressed',
          force: true
        }
      }
    },

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');

  grunt.registerTask('default', ['compass:development','watch']);
  grunt.registerTask('production', ['compass:production']);

};