var shell = require('shelljs');
var _ = require('lodash');


function Plugin(options) {
  var self = this;
}

Plugin.prototype.apply = function (compiler) {
  var self = this;

  compiler.plugin("this-compilation", function(compilation){

      shell.exec('chmod +x ' +__dirname + "/version.sh");

      var result = shell.exec(__dirname + "/version.sh")
        .output
        .replace(/\s/g, '');

      this.options.buildVersion = result;
      this.buildVersion = result;
  })
};

module.exports = Plugin;
