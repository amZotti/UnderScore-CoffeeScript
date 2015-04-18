(function() {
  describe("chain", function() {
    var stooges, youngest;
    stooges = [
      {
        name: 'curly',
        age: 25
      }, {
        name: 'moe',
        age: 21
      }, {
        name: 'larry',
        age: 23
      }
    ];
    youngest = _.chain(stooges).sortBy(function(stooge) {
      return stooge.age;
    }).map(function(stooge) {
      return stooge.name + " is " + stooge.age;
    }).first();
    it("should return a wrapped object", function() {
      return expect(typeof youngest).toEqual("object");
    });
    return it("calling value() should return result of method chaining", function() {
      return expect(youngest.value()).toEqual("moe is 21");
    });
  });

}).call(this);
