(function() {
  var checkObjectForProperties, checkObjectForProperty,
    hasProp = {}.hasOwnProperty;

  window._ = {};

  _.each = _.forEach = function(list, callback, context) {
    var i, index, item, key, len, results1, results2, value;
    if (context == null) {
      context = this;
    }
    if (Array.isArray(list)) {
      results1 = [];
      for (index = i = 0, len = list.length; i < len; index = ++i) {
        item = list[index];
        results1.push(callback.call(context, item, index, list));
      }
      return results1;
    } else {
      results2 = [];
      for (key in list) {
        if (!hasProp.call(list, key)) continue;
        value = list[key];
        results2.push(callback.call(context, value, key, list));
      }
      return results2;
    }
  };

  _.map = _.collect = function(list, callback, context) {
    var i, index, item, key, len, results1, results2, value;
    if (context == null) {
      context = this;
    }
    callback = callback || function(value) {
      return value;
    };
    if (Array.isArray(list)) {
      results1 = [];
      for (index = i = 0, len = list.length; i < len; index = ++i) {
        item = list[index];
        results1.push(callback.call(context, item, index, list));
      }
      return results1;
    } else {
      results2 = [];
      for (key in list) {
        if (!hasProp.call(list, key)) continue;
        value = list[key];
        results2.push(callback.call(context, value, key, list));
      }
      return results2;
    }
  };

  _.reduce = _.inject = _.foldl = function(list, callback, startingValue, context) {
    var iteratee;
    if (startingValue == null) {
      startingValue = 0;
    }
    if (context == null) {
      context = this;
    }
    iteratee = function(element, index, list) {
      return startingValue = callback.call(context, startingValue, element, index, list);
    };
    _.each(list, iteratee, context);
    return startingValue;
  };

  _.reduceRight = _.foldr = function(list, callback, startingValue, context) {
    if (startingValue == null) {
      startingValue = 0;
    }
    if (context == null) {
      context = this;
    }
    return _.reduce(list.reverse(), callback, startingValue, context);
  };

  _.find = _.detect = function(list, callback, context) {
    var result;
    if (context == null) {
      context = this;
    }
    result = void 0;
    _.each(list, function(value, index, list) {
      if (result === void 0 && callback.call(context, value) === true) {
        return result = value;
      }
    });
    return result;
  };

  _.filter = _.select = function(list, callback, context) {
    var results;
    if (context == null) {
      context = this;
    }
    results = [];
    _.each(list, function(value, index, list) {
      if (callback.call(context, value)) {
        return results.push(value);
      }
    });
    return results;
  };

  _.where = function(list, properties) {
    var results;
    results = [];
    _.each(list, function(value, index, list) {
      if (checkObjectForProperties(value, properties)) {
        return results.push(value);
      }
    });
    return results;
  };

  checkObjectForProperties = function(object, properties) {
    var key;
    for (key in properties) {
      if (!checkObjectForProperty(key, properties[key], object)) {
        return false;
      }
    }
    return true;
  };

  checkObjectForProperty = function(key, value, object) {
    var otherKey;
    for (otherKey in object) {
      if (otherKey === key && value === object[key]) {
        return true;
      }
    }
    return false;
  };

  _.findWhere = function(list, properties) {
    return _.where(list, properties)[0];
  };

  _.reject = function(list, callback, context) {
    if (context == null) {
      context = this;
    }
    return _.filter(list, function(value) {
      return !callback.call(context, value);
    });
  };

  _.every = _.all = function(list, callback, context) {
    var status;
    if (context == null) {
      context = this;
    }
    status = true;
    _.each(list, function(value) {
      if (!callback.call(context, value)) {
        return status = false;
      }
    });
    return status;
  };

  _.some = _.any = function(list, callback, context) {
    if (context == null) {
      context = this;
    }
    return _.filter(list, callback, context).length !== 0;
  };

  _.contains = _.include = function(list, value) {
    return _.some(list, function(element) {
      return element === value;
    });
  };

  _.invoke = function(list, methodName) {
    var args;
    args = [].slice.call(arguments, 2);
    return _.map(list, function(value) {
      return value[methodName].apply(value, args);
    });
  };

  _.pluck = function(list, key) {
    return _.map(list, function(obj) {
      return obj[key];
    });
  };

  _.maxOrMin = function(list, callback, context, equality) {
    var m, result;
    result = void 0;
    m = void 0;
    _.each(list, function(value) {
      var count;
      if (callback) {
        count = callback.call(context, value);
      } else {
        count = value;
      }
      m = m || count;
      result = result || value;
      if (equality(m, count)) {
        return result = value;
      }
    });
    return result || Number.POSITIVE_INFINITY;
  };

  _.max = function(list, callback, context) {
    if (context == null) {
      context = this;
    }
    return _.maxOrMin(list, callback, context, function(m, count) {
      return count > m;
    });
  };

  _.min = function(list, callback, context) {
    if (context == null) {
      context = this;
    }
    return _.maxOrMin(list, callback, context, function(m, count) {
      return count < m;
    });
  };

  _.sortBy = function(list, iteratee, context) {
    if (context == null) {
      context = this;
    }
    return _.map(_.map(list, (function(value) {
      return {
        key: iteratee(value),
        value: value
      };
    }), context).sort(function(a, b) {
      return a.key > b.key;
    }), function(obj) {
      return obj.value;
    }, context);
  };

  _.organizeBy = function(list, iteratee) {
    var getKey;
    getKey = function(value, iteratee) {
      if (typeof iteratee === "string") {
        return value[iteratee];
      } else {
        return iteratee(value);
      }
    };
    return _.map(list, function(value) {
      return {
        key: getKey(value, iteratee),
        value: value
      };
    });
  };

  _.groupBy = function(list, iteratee, context) {
    var result;
    if (context == null) {
      context = this;
    }
    result = {};
    _.each(_.organizeBy(list, iteratee, context), function(obj) {
      if (result[obj.key] === void 0) {
        result[obj.key] = [];
      }
      return result[obj.key].push(obj.value);
    });
    return result;
  };

  _.indexBy = function(list, iteratee, context) {
    var result;
    if (context == null) {
      context = this;
    }
    result = {};
    _.each(_.organizeBy(list, iteratee, context), function(obj) {
      return result[obj.key] = obj.value;
    });
    return result;
  };

  _.countBy = function(list, iteratee, context) {
    var result;
    if (context == null) {
      context = this;
    }
    result = {};
    _.each(_.organizeBy(list, iteratee, context), function(obj) {
      if (result[obj.key] === void 0) {
        result[obj.key] = 0;
      }
      return result[obj.key] += 1;
    });
    return result;
  };

  _.objectValuesToArray = function(list) {
    if (!Array.isArray(list)) {
      return list = _.map(list, function(value) {
        return value;
      });
    } else {
      return list;
    }
  };

  _.randomIndex = function(size) {
    return Math.floor(Math.random() * size);
  };

  _.shuffle = function(list) {
    var i, popRandomElementFrom, results1, size;
    list = _.objectValuesToArray(list);
    size = list.length;
    popRandomElementFrom = function(list, index) {
      var item;
      item = list[index];
      list[index] = list[size];
      size -= 1;
      return item;
    };
    return _.map((function() {
      results1 = [];
      for (var i = 1; 1 <= size ? i <= size : i >= size; 1 <= size ? i++ : i--){ results1.push(i); }
      return results1;
    }).apply(this), function() {
      return popRandomElementFrom(list, _.randomIndex(list));
    });
  };

  _.sample = function(list, n) {
    var i, results1;
    if (n == null) {
      n = 1;
    }
    list = _.objectValuesToArray(list);
    return _.map((function() {
      results1 = [];
      for (var i = 1; 1 <= n ? i <= n : i >= n; 1 <= n ? i++ : i--){ results1.push(i); }
      return results1;
    }).apply(this), function() {
      return list[_.randomIndex(list.length)];
    });
  };

  _.toArray = function(list) {
    return _.map(list, function(value) {
      return value;
    });
  };

  _.size = function(list) {
    return _.toArray(list).length;
  };

  _.partition = function(array, callback) {
    return [_.filter(array, callback), _.reject(array, callback)];
  };

}).call(this);
