(function() {
  var slice = [].slice;

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

  _.times = function() {
    var args, context, i, iteratee, j, n, ref, results;
    n = arguments[0], iteratee = arguments[1], context = arguments[2], args = 4 <= arguments.length ? slice.call(arguments, 3) : [];
    results = [];
    for (i = j = 0, ref = n; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
      results.push(iteratee.apply(context, args));
    }
    return results;
  };

  _.random = function(min, max) {
    if (min == null) {
      min = 0;
    }
    return min + Math.floor(Math.random() * (max - min + 1));
  };

}).call(this);
