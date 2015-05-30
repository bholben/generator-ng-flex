'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.factory '<%= upperCamel %>', class <%= upperCamel %>

  @instance = undefined
  @someValue = '<%= upperCamel %>'
  constructor: ->
    if @instance then @instance else @instance = @

  @someMethod: ->
    '<%= upperCamel %>'

