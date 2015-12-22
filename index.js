var shell = require('shelljs');


function Plugin(options) {
  if(!options.type) {throw Error("No run type defined!");}
  if(!options.path) {throw Error("No path defined!");}
  var self = this;

  var defaultOptions = {
    type: "shell",
    path: "/"
  };

  self.options = _.extend({}, defaultOptions, options);

}

Plugin.prototype.apply = function (compiler) {
  var self = this;

  compiler.plugin('compile', function (params) {
    if(this.options.type === "shell"){
      var result = shell.exec(this.options.path)
        .output
        .replace(/\s/g, '');

      console.log(result);
    }
    callback(null, null);
  });
};

module.exports = Plugin;
