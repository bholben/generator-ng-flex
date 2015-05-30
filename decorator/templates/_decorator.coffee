'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.config ($provide) ->
  $provide.decorator '<%= name %>', ($delegate) ->
    $delegate.simpleFunction = () ->
      return '<%= name %>'

    return $delegate

