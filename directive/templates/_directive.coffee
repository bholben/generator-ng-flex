'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.directive '<%= lowerCamel %>', ->

  templateUrl: '<%= templateUrl %>/<%= hyphenName %>-directive.tpl.html'
  controller: '<%= upperCamel %><% if (controllerAs) { %> as <%= lowerCamel %><% } %>'
  link: (scope, element, attrs) ->
    ###jshint unused:false ###
    ###eslint "no-unused-vars": [2, {"args": "none"}]###


.controller '<%= upperCamel %>', class <%= upperCamel %>

  constructor: <% if (!controllerAs) { %>($scope) <% } %>->

    <% if (controllerAs) { %>@name = '<%= lowerCamel %>'<% } else { %>$scope.<%= lowerCamel %> = {}
    $scope.<%= lowerCamel %>.name = '<%= lowerCamel %>'<% } %>

