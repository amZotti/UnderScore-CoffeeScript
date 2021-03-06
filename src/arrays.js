(function() {
  var flatten, format, log,
    slice = [].slice,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

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
    var isArray, item, j, len, results1;
    if (pushNextItem == null) {
      pushNextItem = true;
    }
    results1 = [];
    for (j = 0, len = array.length; j < len; j++) {
      item = array[j];
      isArray = Array.isArray(item);
      if (isArray === true && pushNextItem === false) {
        results1.push(results.push(item));
      } else if (isArray === true && shallow === false) {
        results1.push(flatten(item, shallow, results));
      } else if (isArray === true && shallow === true) {
        results1.push(flatten(item, shallow, results, false));
      } else {
        results1.push(results.push(item));
      }
    }
    return results1;
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
    array = arguments[0], values = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return _.reject(array, function(value) {
      return indexOf.call(values, value) >= 0;
    });
  };

  _.uniq = _.unique = function(array, iteratee) {
    var results;
    if (iteratee == null) {
      iteratee = function(value) {
        return value;
      };
    }
    results = [];
    return _.filter(array, function(value) {
      if (!_.contains(results, iteratee(value))) {
        return results.push(iteratee(value));
      }
    });
  };

  _.union = function() {
    var arrays;
    arrays = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    return _.uniq(_.flatten(arrays));
  };

  _.zip = function() {
    var arrays, longestArray;
    arrays = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    longestArray = _.sortBy(arrays, function(array) {
      return -array.length;
    })[0];
    return _.map(longestArray, function(value, index) {
      return _.map(arrays, function(array) {
        return array[index];
      });
    });
  };

  log = function(value) {
    return console.log(JSON.stringify(value));
  };

  format = function(arrays) {
    if (arrays.length === 2) {
      return arrays = _.zip(arrays[0], arrays[1]);
    } else {
      return arrays = arrays[0];
    }
  };

  _.object = function() {
    var arrays, result;
    arrays = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    arrays = format(arrays);
    result = {};
    _.each(arrays, function(array) {
      return result[array[0]] = array[1];
    });
    return result;
  };

  _.indexOf = function(array, value) {
    return (_.first(_.compact(_.map(array, function(item, index) {
      if (item === value) {
        return index;
      }
    })))) || -1;
  };

  _.intersection = function() {
    var arrays;
    arrays = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    return _.compact(_.map(arrays[0], function(item) {
      if (_.every(arrays, function(array) {
        return indexOf.call(array, item) >= 0;
      })) {
        return item;
      }
    }));
  };

  _.difference = function() {
    var array, others;
    array = arguments[0], others = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    others = _.flatten(others);
    return _.reject(array, function(value) {
      return indexOf.call(others, value) >= 0;
    });
  };

  _.lastIndexOf = function(array, value, fromIndex) {
    if (fromIndex == null) {
      fromIndex = 0;
    }
    return (_.last(_.compact(_.map(array, function(item, index) {
      if (fromIndex <= index && item === value) {
        return index;
      }
    })))) || -1;
  };

  _.transform = function(value, iteratee) {
    if (typeof iteratee === 'string') {
      return value[iteratee];
    } else if (typeof iteratee === 'undefined') {
      return value;
    } else {
      return iteratee.call(this, value);
    }
  };

  _.sortedIndex = function(array, value, iteratee) {
    value = _.transform(value, iteratee);
    return _.first(_.compact(_.map(array, function(item, index) {
      if (_.transform(item, iteratee) >= value) {
        return index;
      }
    })));
  };

  _.range = function(start, stop, step) {
    var i, j, ref, ref1, ref2, results1;
    if (step == null) {
      step = 1;
    }
    stop = stop || start;
    if (start === stop) {
      start = 0;
    }
    results1 = [];
    for (i = j = ref = start, ref1 = stop, ref2 = step; ref2 > 0 ? j < ref1 : j > ref1; i = j += ref2) {
      results1.push(i);
    }
    return results1;
  };

}).call(this);
