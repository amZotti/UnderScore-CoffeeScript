(function() {
  var fillInArguments,
    slice = [].slice;

  _.bind = function() {
    var context, fn, partial;
    fn = arguments[0], context = arguments[1], partial = 3 <= arguments.length ? slice.call(arguments, 2) : [];
    return function() {
      var args, full;
      full = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      args = partial.concat(full);
      return fn.apply(context, args);
    };
  };

  _.bindAll = function() {
    var functions, object;
    object = arguments[0], functions = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    _.each(functions, function(fn) {
      return _.bind(fn, object);
    });
    return object;
  };

  fillInArguments = function(partial, full) {
    _.each(partial, function(arg, index) {
      if (arg === "_") {
        return partial[index] = full.pop();
      }
    });
    return partial.concat(full);
  };

  _.partial = function() {
    var fn, partial;
    fn = arguments[0], partial = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return function() {
      var args, full;
      full = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      args = fillInArguments(partial, full);
      return fn.apply(this, args);
    };
  };

  _.memoize = function(fn) {
    var cache;
    cache = {};
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      return cache[args[0]] || (cache[args[0]] = fn.apply(this, args));
    };
  };

  _.delay = function() {
    var args, fn, wait;
    fn = arguments[0], wait = arguments[1], args = 3 <= arguments.length ? slice.call(arguments, 2) : [];
    return setTimeout((function() {
      return fn.apply(fn, args);
    }), wait);
  };

  _.defer = function() {
    var args, fn;
    fn = arguments[0], args = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return _.delay(fn, 1, args);
  };

  _.thorttle = function(fn, wait) {
    var blocking;
    blocking = false;
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (!blocking) {
        fn.apply(fn, args);
        blocking = true;
        return _.delay((function() {
          return blocking = false;
        }), wait);
      }
    };
  };

  _.debounce = function(fn, wait) {
    var blocking, id;
    blocking = false;
    id = void 0;
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (!blocking) {
        fn.apply(fn, args);
        blocking = true;
        return id = _.delay((function() {
          return blocking = false;
        }), wait);
      } else {
        clearTimeout(id);
        return id = _.delay((function() {
          return blocking = false;
        }), wait);
      }
    };
  };

  _.once = function(fn) {
    var called;
    called = false;
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (!called) {
        called = true;
        return fn.apply(fn, args);
      }
    };
  };

  _.after = function(count, fn) {
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (--count < 1) {
        return fn.apply(fn, args);
      }
    };
  };

  _.before = function(count, fn) {
    var result;
    result = void 0;
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (0 < --count) {
        return result = fn.apply(fn, args);
      } else {
        return result;
      }
    };
  };

  _.wrap = function(fn, wrapper) {
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      args.unshift(fn);
      return wrapper.apply(wrapper, args);
    };
  };

  _.negate = function(predicate) {
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      return !predicate.apply(predicate, args);
    };
  };

  _.compose = function() {
    var functions;
    functions = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    return function() {
      var args;
      args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      _.each(functions, function(fn) {
        return args = [fn.apply(fn, args)];
      });
      return args[0];
    };
  };

}).call(this);
