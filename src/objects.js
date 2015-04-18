(function() {
  var filterObject,
    slice = [].slice,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  _.keys = function(obj) {
    return _.map(obj, function(value, key) {
      return key;
    });
  };

  _.values = function(obj) {
    return _.map(obj, function(value) {
      return value;
    });
  };

  _.pairs = function(obj) {
    return _.map(obj, function(value, key) {
      return [key, value];
    });
  };

  _.invert = function(obj) {
    _.each(obj, function(value, key) {
      obj[value] = key;
      return delete obj[key];
    });
    return obj;
  };

  _.functions = _.methods = function(obj) {
    return _.compact(_.map(obj, function(value, key) {
      if (typeof value === 'function') {
        return key;
      }
    }));
  };

  _.extend = function() {
    var destination, sources;
    destination = arguments[0], sources = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    _.each(sources, function(obj) {
      return _.each(obj, function(value, key) {
        return destination[key] = value;
      });
    });
    return destination;
  };

  _.isFunction = function(object) {
    return typeof object === 'function';
  };

  _.isElement = function(obj) {
    return !!(obj && obj.nodeType === 1);
  };

  _.isArray = function(obj) {
    return Array.isArray(obj);
  };

  _.isObject = function(value) {
    return typeof value === 'function' || typeof value === 'object';
  };

  _.isArgument = function(obj) {
    return obj.toString() === "[object Arguments]";
  };

  _.isNumber = function(value) {
    return typeof value === 'number' || typeof value === 'NaN';
  };

  _.isString = function(value) {
    return typeof value === 'string';
  };

  _.isBoolean = function(value) {
    return typeof value === 'boolean';
  };

  _.isDate = function(value) {
    return value instanceof Date;
  };

  _.isRegExp = function(value) {
    return value instanceof RegExp;
  };

  _.isNaN = function(value) {
    return Number.isNaN(value);
  };

  _.isUndefined = function(value) {
    return value === void 0;
  };

  _.isNull = function(value) {
    return value === null;
  };

  _.isFinite = function(value) {
    return isFinite(value) && !isNaN(parseFloat(value));
  };

  filterObject = function() {
    var fn, keys, obj, result, whiteList;
    whiteList = arguments[0], obj = arguments[1], keys = 3 <= arguments.length ? slice.call(arguments, 2) : [];
    keys = _.flatten(keys, true);
    fn = keys[0];
    result = {};
    _.each(obj, function(value, key) {
      var containsValue;
      containsValue = _.isFunction(fn) && fn(value) || indexOf.call(keys, key) >= 0;
      if (whiteList && containsValue || !whiteList && !containsValue) {
        return result[key] = value;
      }
    });
    return result;
  };

  _.pick = function() {
    var keys, obj;
    obj = arguments[0], keys = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return filterObject(true, obj, _.flatten(keys, true));
  };

  _.omit = function() {
    var keys, obj;
    obj = arguments[0], keys = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    return filterObject(false, obj, _.flatten(keys, true));
  };

  _.defaults = function() {
    var defaults, object;
    object = arguments[0], defaults = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    _.each(defaults, function(obj) {
      return _.each(obj, function(value, key) {
        if (!object.hasOwnProperty(key)) {
          return object[key] = value;
        }
      });
    });
    return object;
  };

  _.clone = function(obj) {
    var result;
    result = {};
    console.log("WORKS");
    _.each(obj, function(value, key) {
      return result[key] = value;
    });
    return result;
  };

  _.has = function(obj, key) {
    return Object.prototype.hasOwnProperty.call(obj, key);
  };

  _.property = function(key) {
    return function(obj) {
      return obj[key];
    };
  };

}).call(this);
