'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.service '<%= upperCamel %>', class <%= upperCamel %>

  constructor: ->
    @name = '<%= upperCamel %>'

  get: ->
    @name

