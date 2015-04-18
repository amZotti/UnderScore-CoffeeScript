module.exports = function(grunt) {
  grunt.initConfig({
    coffee: {
      src: {
        expand: true,
        flatten: true,
        cwd: './src',
        src: ['*.coffee'],
        dest: './src',
        ext: '.js'
      },

      spec: {
        expand: true,
        flatten: true,
        cwd: './spec',
        src: ['*.coffee'],
        dest: './spec',
        ext: '.js'
      }
    },

    watch: {
      scripts: {
        files: ['./spec/*.coffee', './src/*.coffee'],
        tasks: ['coffee'],
        options: {
          spawn: false
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', ['watch']);
};
