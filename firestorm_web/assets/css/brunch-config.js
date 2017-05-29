exports.config = {
  // ...
  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    sass: {
      options: {
        includePaths: [
          "node_modules/purecss/build",
          "node_modules/normalize-css",
          "node_modules/typeplate-starter-kit/dist/scss"
        ]
      }
    }
  },
  // ...
};