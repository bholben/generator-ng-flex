'use strict'

angular.module '<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>'
.value '<%= lowerCamel %>', ->
  key: 'value'

