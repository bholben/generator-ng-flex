'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.provider '<%= upperCamel %>', ->
  $get: ->
    '<%= upperCamel %>'

