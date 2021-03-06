(() => {
  'use strict';

  class <%= upperCamel %> {
    constructor() {
    }

    get() {
      return '<%= upperCamel %>';
    }
  }

  /**
   * @ngdoc service
   * @name <% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>.service:<%= upperCamel %>
   *
   * @description
   *
   */
  angular
    .module('<% if (parentModuleName) { %><%= parentModuleName %>.<% } %><%= moduleName %>')
    .service('<%= upperCamel %>', <%= upperCamel %>);
}());
