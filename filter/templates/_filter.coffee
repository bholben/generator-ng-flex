'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.filter '<%= lowerCamel %>', class <%= upperCamel %>

  constructor: (str='', len=20) ->

    return if str.length > len then str.substring 0, len + '...' else str

