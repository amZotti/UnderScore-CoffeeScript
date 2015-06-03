// Generated by CoffeeScript 1.9.3
(function() {
  _.identity = function(value) {
    return value;
  };

  _.constant = function(value) {
    return function() {
      return value;
    };
  };

  _.noop = function() {
    return void 0;
  };

  _.times = function(n, iteratee, context) {
    var i, j, ref, results;
    results = [];
    for (i = j = 1, ref = n; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
      results.push(iteratee.call(context, i));
    }
    return results;
  };

  _.random = function(min, max) {
    if (min === void 0) {
      return NaN;
    }
    if (max === void 0) {
      max = min;
      min = 0;
    }
    return min + Math.floor(Math.random() * (max - min + 1));
  };

  _.mixin = function(fns) {
    var name, results;
    results = [];
    for (name in fns) {
      results.push(_[name] = fns[name]);
    }
    return results;
  };

}).call(this);
