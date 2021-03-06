(function() {
  describe('arrays', function() {
    var arr;
    arr = null;
    beforeEach(function() {
      return arr = [5, 4, 3, 2, 1];
    });
    describe('_.first', function() {
      it('should return the first element', function() {
        var result;
        result = _.first(arr);
        return expect(result).toEqual(5);
      });
      it('should return the first n elements when n is provided', function() {
        var result;
        result = _.first(arr, 3);
        return expect(result).toEqual([5, 4, 3]);
      });
      return it('should return all the elements if n exceeds size', function() {
        var result;
        result = _.first(arr, 20);
        return expect(result).toEqual(arr);
      });
    });
    describe('_.initial', function() {
      it('should return all elements except the last', function() {
        var result;
        result = _.initial(arr);
        return expect(result).toEqual([5, 4, 3, 2]);
      });
      it('should exclude n elements when n is provided', function() {
        var result;
        result = _.initial(arr, 2);
        return expect(result).toEqual([5, 4, 3]);
      });
      return it('should return an empty array if n exceeds size', function() {
        var result;
        result = _.initial(arr, 99);
        return expect(result).toEqual([]);
      });
    });
    describe('_.last', function() {
      it('should return the last element', function() {
        var result;
        result = _.last(arr);
        return expect(result).toEqual(1);
      });
      it('should accept argument n which will return last n elements', function() {
        var result;
        result = _.last(arr, 3);
        return expect(result).toEqual([3, 2, 1]);
      });
      return it('should return the entire array if n exceeds size', function() {
        var result;
        result = _.last(arr, 33);
        return expect(result).toEqual(arr);
      });
    });
    describe('_.rest', function() {
      it('should return all elements except first', function() {
        var result;
        result = _.rest(arr);
        return expect(result).toEqual([4, 3, 2, 1]);
      });
      it('should accept argument index which will return elements onward starting at index', function() {
        var result;
        result = _.rest(arr, 3);
        return expect(result).toEqual([2, 1]);
      });
      return it('should return the empty array if index exceeds size', function() {
        var result;
        result = _.rest(arr, 33);
        return expect(result).toEqual([]);
      });
    });
    describe('_.compact', function() {
      return it('should return a new array with all falsey values removed', function() {
        var result;
        result = _.compact([0, 1, false, 2, '', 3]);
        return expect(result).toEqual([1, 2, 3]);
      });
    });
    describe('_.flatten', function() {
      it('should flatten a nested array', function() {
        var result;
        result = _.flatten([1, [2], [3, [[4]]]]);
        return expect(result).toEqual([1, 2, 3, 4]);
      });
      return it('should flatten only a single level if shallow argument is provided', function() {
        var result;
        result = _.flatten([1, [2], [3, [[4]]]], true);
        return expect(result).toEqual([1, 2, 3, [[4]]]);
      });
    });
    describe('_.without', function() {
      return it('should return a copy of the array with all instances of the values passed in as arguments removed', function() {
        var result;
        result = _.without([1, 2, 1, 0, 3, 1, 4], 0, 1);
        return expect(result).toEqual([2, 3, 4]);
      });
    });
    describe('_.uniq', function() {
      it('should produce a duplicate free version of the array', function() {
        var result;
        result = _.uniq([1, 2, 1, 3, 1, 4]);
        return expect(result).toEqual([1, 2, 3, 4]);
      });
      return it('should compute unique items based on transformation', function() {
        var result;
        result = _.uniq(arr, function(value) {
          return value % 2 === 0;
        });
        return expect(result).toEqual([5, 4]);
      });
    });
    describe('_.union', function() {
      return it('should return the list of unique items in order they appear in the passed in arrays', function() {
        var result;
        result = _.union([1, 2, 3], [101, 2, 1, 10], [2, 1]);
        return expect(result).toEqual([1, 2, 3, 101, 10]);
      });
    });
    describe('_.zip', function() {
      it('should merge together arrays with corresponding positions', function() {
        var result;
        result = _.zip(['moe', 'larry', 'curly'], [30, 40, 50], [true, false, false]);
        return expect(result).toEqual([["moe", 30, true], ["larry", 40, false], ["curly", 50, false]]);
      });
      return it('should fill missing values in with undefined', function() {
        var result;
        result = _.zip([1, 2, 3], ['a', 'b']);
        return expect(result).toEqual([[1, 'a'], [2, 'b'], [3, void 0]]);
      });
    });
    describe('_.object', function() {
      it('should merge an array of keys with an array of values to creates an object', function() {
        var result;
        result = _.object(['moe', 'larry', 'curly'], [30, 40, 50]);
        return expect(result).toEqual({
          moe: 30,
          larry: 40,
          curly: 50
        });
      });
      return it('should merge arrays of [key, value] in an array into an object', function() {
        var result;
        result = _.object([['moe', 30], ['larry', 40], ['curly', 50]]);
        return expect(result).toEqual({
          moe: 30,
          larry: 40,
          curly: 50
        });
      });
    });
    describe('_.indexOf', function() {
      it('should return the first index of the provided value', function() {
        var result;
        result = _.indexOf([1, 2, 3], 2);
        return expect(result).toEqual(1);
      });
      return it('should return -1 if value cannot be found', function() {
        var result;
        result = _.indexOf(arr, "barbeque");
        return expect(result).toEqual(-1);
      });
    });
    describe('_.intersection', function() {
      return it('should return an array with items that are present in each array arguments', function() {
        var result;
        result = _.intersection([1, 2, 3], [101, 2, 1, 10], [2, 1]);
        return expect(result).toEqual([1, 2]);
      });
    });
    describe('_.difference', function() {});
    it('should return values from array that are not present in other arrays', function() {
      var result;
      result = _.difference([1, 2, 3, 4, 5], [5, 2, 10]);
      return expect(result).toEqual([1, 3, 4]);
    });
    describe('_.lastIndexOf', function() {
      return it('should return the index of the last occurrence of value in the array, or -1 if value is not present', function() {
        var result;
        result = _.lastIndexOf([1, 2, 3, 1, 2, 3], 2);
        return expect(result).toEqual(4);
      });
    });
    describe('_.sortedIndex', function() {
      it('should determine where a given value will be inserted in a sorted list', function() {
        var result;
        result = _.sortedIndex([10, 20, 30, 40, 50], 35);
        return expect(result).toEqual(3);
      });
      it('should determine where a given object will be inserted in a sorted list', function() {
        var result, stooges;
        stooges = [
          {
            name: 'moe',
            age: 40
          }, {
            name: 'curly',
            age: 60
          }
        ];
        result = _.sortedIndex(stooges, {
          name: 'larry',
          age: 50
        }, 'age');
        return expect(result).toEqual(1);
      });
      return it('should accept an optional callback which transforms', function() {
        var iteratee, result;
        iteratee = function(num) {
          if (num % 2 === 0) {
            return num + 10;
          } else {
            return num;
          }
        };
        result = _.sortedIndex([10, 20, 30, 40, 50], 35, iteratee);
        return expect(result).toEqual(2);
      });
    });
    return describe('_.range', function() {
      it('should create a range of values provided stop value', function() {
        return expect(_.range(10)).toEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      });
      it('should create a range of values provided start and stop values', function() {
        return expect(_.range(1, 11)).toEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      });
      it('should create a range of values with steps', function() {
        return expect(_.range(0, 30, 5)).toEqual([0, 5, 10, 15, 20, 25]);
      });
      it('should create a range of negative values', function() {
        return expect(_.range(0, -10, -1)).toEqual([0, -1, -2, -3, -4, -5, -6, -7, -8, -9]);
      });
      return it('should default to empty array', function() {
        return expect(_.range(0)).toEqual([]);
      });
    });
  });

}).call(this);
