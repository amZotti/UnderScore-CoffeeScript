// Generated by CoffeeScript 1.8.0
(function() {
  var flatten,
    __slice = [].slice,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  _.first = _.head = _.take = function(array, n) {
    if (n == null) {
      n = 0;
    }
    if (n === 0) {
      return array[0];
    }
    if (n >= _.size(array)) {
      return array;
    }
    return array.slice(0, n);
  };

  _.initial = function(array, n) {
    if (n == null) {
      n = 0;
    }
    if (n === 0) {
      return array.slice(0, -1);
    }
    return array.slice(0, -n);
  };

  _.last = function(array, n) {
    var size;
    if (n == null) {
      n = 0;
    }
    size = _.size(array);
    if (n === 0) {
      return array[size - 1];
    }
    if (n >= size) {
      return array;
    }
    return array.slice(n - 1);
  };

  _.rest = _.tail = _.drop = function(array, index) {
    if (index == null) {
      index = 1;
    }
    if (index >= _.size(array)) {
      return [];
    }
    return array.slice(index);
  };

  _.compact = function(array) {
    return _.filter(array, function(value) {
      return !!value;
    });
  };

  flatten = function(array, shallow, results, pushNextItem) {
    var isArray, item, _i, _len, _results;
    if (pushNextItem == null) {
      pushNextItem = true;
    }
    _results = [];
    for (_i = 0, _len = array.length; _i < _len; _i++) {
      item = array[_i];
      isArray = Array.isArray(item);
      if (isArray === true && pushNextItem === false) {
        _results.push(results.push(item));
      } else if (isArray === true && shallow === false) {
        _results.push(flatten(item, shallow, results));
      } else if (isArray === true && shallow === true) {
        _results.push(flatten(item, shallow, results, false));
      } else {
        _results.push(results.push(item));
      }
    }
    return _results;
  };

  _.flatten = function(array, shallow) {
    var results;
    if (shallow == null) {
      shallow = false;
    }
    results = [];
    flatten(array, shallow, results);
    return results;
  };

  _.without = function() {
    var array, values;
    array = arguments[0], values = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    return _.reject(array, function(value) {
      return __indexOf.call(values, value) >= 0;
    });
  };

}).call(this);
