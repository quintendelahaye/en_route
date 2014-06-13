module.exports = function(grunt)
{
    grunt.initConfig({

        watch: {
            scss: {
              files: ['_scss/*.scss'],
              tasks: ['compass:development']
            }
          },
        compass:{
            development:{
                options:{
                    sassDir:"_scss",
                    cssDir:"css",
                    force:true,
                    noLineComments:true
                }
            },
            production:{
                options:{
                    sassDir:"_scss",
                    cssDir:"css",
                    noLineComments:true,
                    force:true,
                    outputStyle:'compressed'
                }
            }
        }


    })

    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default',['compass:development', 'watch']);
    grunt.registerTask('production',['compass:production']);

};