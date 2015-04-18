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
        cwd: './src',
        src: ['*.coffee'],
        dest: './src',
        ext: '.js'
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-coffee');
};
