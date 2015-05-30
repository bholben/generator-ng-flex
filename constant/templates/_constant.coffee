'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.constant '<%= lowerCamel %>', ->
  key: 'value'

