'use strict'

angular.module('<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>')
.controller '<%= ctrlName %>', class <%= ctrlName %>

  constructor: <% if (!controllerAs) { %>($scope) <% } %>->

    <% if (controllerAs) { %>@ctrlName = '<%= ctrlName %>'<% } else { %>$scope.<%= lowerCamel %> = {}
    $scope.<%= lowerCamel %>.ctrlName = '<%= ctrlName %>'<% } %>

