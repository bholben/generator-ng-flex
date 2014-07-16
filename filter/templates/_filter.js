'use strict';

angular.module('<%= appName %>').filter('<%= filterName %>', function () {
  return function (input) {
    var temp = [];
    angular.forEach(input, function (item) {
      if(item > 3) {
        temp.push(item);
      }
    });
    return temp;
  };
});