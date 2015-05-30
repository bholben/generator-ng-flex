'use strict'

angular.module '<%= moduleName %>'
.config (<% if (ngRoute) { %>$routeProvider<% } else { %>$urlRouterProvider<% } %>) ->
    <% if (ngRoute) { %>$routeProvider.otherwise
      <% if (ngversion === '1.2.*') { %>redirectTo: '/home'
      <% } else { %>'/home'<% } %>
    <% } else { %>$urlRouterProvider.otherwise '/home'<% } %>

