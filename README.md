# generator-ng-flex 

> [Yeoman](http://yeoman.io) generator for modular AngularJS apps with Gulp and optional Polymer support

*Forked from Dustin Specker's ng-flex and inspired by [John Papa](https://github.com/johnpapa)'s [Angular Style Guide](https://github.com/johnpapa/angular-styleguide) and [Todd Motto](https://github.com/toddmotto)'s [AngularJS styleguide](https://github.com/toddmotto/angularjs-styleguide).*

## Purpose

This generator focuses on organizing Angular components by feature (home, about, video player, etc.) instead of by type (controller, service, directive, etc.) to encourage the development of self-contained, reusable components.

A typical workflow with this generator consists of creating an Angular module ([ng-flex:module](#module)) and then generating controllers, directives, etc. for this module to create a new feature.

## Usage

Install `generator-ng-flex`:

```
npm install -g bower gulp yo generator-ng-flex
```

If TypeScript is going to be used, `tsd` will need to be installed:

```
npm install -g tsd
```

Run `yo ng-flex`
Yeoman will then ask for an app name and language preferences.

**If using Node 0.12, there is a bug in Yeoman or Node causing yeoman generators to hang. With ng-flex, if after it outputs the generated home module files it hangs, then it is safe to enter `Ctrl+C`, etc. The project is good to go and everything else should work normally.**

Run `gulp` to build and start the development environment. [More detail on Gulp tasks](#gulp-tasks-in-detail)

## Generators

Available generators:
* AngularJS
  - [ng-flex](#app) (a.k.a. [ng-flex:app](#app))
  - [ng-flex:constant](#constant)
  - [ng-flex:controller](#controller)
  - [ng-flex:decorator](#decorator)
  - [ng-flex:directive](#directive)
  - [ng-flex:factory](#factory)
  - [ng-flex:filter](#filter)
  - [ng-flex:module](#module)
  - [ng-flex:provider](#provider)
  - [ng-flex:route](#route)
  - [ng-flex:service](#service)
  - [ng-flex:value](#value)
  - [ng-flex:view](#view)
* Polymer
  - [ng-flex:element](#element)

Languages and Features supported:
  * Angular Versions
    - 1.2.\*, 1.3.\*, 1.4.\* (currently in RC)
  * Markup
    - HAML, HTML, Jade
  * Application scripting languages
    - CoffeeScript, EcmaScript2015 (ES6) with Babel, JavaScript (ES5), TypeScript
  * Testing scripting languages
    - CoffeeScript, EcmaScript2015 (ES6) with Babel, JavaScript (ES5), TypeScript†
  * Style languages
    - CSS, LESS, SCSS, Stylus
  * Routers
    - Angular Route, UI Router
  * Unit testing
    - Jasmine (Karma as the test runner) for AngularJS
    - Mocha with Chai (Karma as the test runner) for AngularJS
  * e2e testing
    - Jasmine (run with Protractor) for AngularJS
    - Mocha, Chai, and Chai as Promised (run with Protractor) for AngularJS
  * Frameworks (scaffolds simple navbar)
    - Angular Material (1.3.* or higher only)
      - Doesn't scaffold navbar, yet
    - Bootstrap with AngularStrap
    - Bootstrap with UI Bootstrap (1.2.* only)
    - Foundation with Angular Foundation
  * Polymer
    - Core, Paper
  * Task runners
    - Gulp
  * Other supported Bower packages:
    - Angular Animate
    - Angular Cookies
    - Angular Messages
    - Angular Resource
    - Angular Sanitize
    - Angular Touch
    - Font Awesome
    - Lo-Dash
    - Restangular

[Configurations](#configurations):
  * Syntax
    - [Controller As](#controller-as-syntax)

† e2e tests are not supported in TypeScript. JavaScript will instead be used for e2e tests.

### Gulp Tasks Briefing
`gulp` will start a localhost and open in the default browser

Using `--stage prod` will concat and minify HTML, CSS, and Angular modules.

`gulp build` will compile the assets

`gulp dev` will call the build task and setup the development environment

`gulp unitTest` will run unit tests via Karma and create code coverage reports

`gulp webdriverUpdate` will download the Selenium server standalone and Chrome driver for e2e testing

`gulp e2eTest` will run e2e tests via Protractor (must start a localhost before running `gulp e2eTest`)

[Gulp Tasks in Detail](#gulp-tasks-in-detail)

* * *
**All generators ask for a module name except app and element. All generators except app take a name as an argument. A name can be written with CamelCase or hyphens.**

Generators requiring a module can take a module option to bypass the prompt:
```
yo ng-flex:view newView --module=home/kitchen
```
**A module value of `app` will add the new components to the module defined in app.js or app.coffee.**
* * *

**Examples are shown with HTML, LESS, JavaScript, Jasmine, and UI Router as the app configuration.**

### App
Asks for application name and language preferences to scaffold out an application with a home module. It will also ask if tests should be placed in the `app/` or `tests/` directory. It'll ask for some additional Bower dependencies and then install npm and Bower dependencies.

Example:

Run `yo ng-flex` to get started. ng-flex will then asks you some questions:

```
[?] What is the app's name?
[?] Which version of Angular should be used?
[?] Which structure should be used?
[?] Which is the preferred markup language?
[?] Which is the preferred application scripting language?
[?] Want to use Controller As syntax?
[?] By default, should the route generator create controllers?
[?] Which is the preferred test scripting language?
[?] Which is the preferred unit testing framework?
[?] Which is the preferred e2e testing framework?
[?] Which is the preferred style language?
[?] Should Polymer support be enabled?
[?] Should a framework be setup?
[?] Should ngRoute be used instead of UI Router?
[?] Which additional Bower components should be installed?
```

ng-flex makes some assumptions, but these can be overridden.

| Option | Default Value| Info |
| -------| ------------ | ---- |
| host | localhost | BrowserSync and Protractor will use this host. |
| port | 3000 | BrowserSync and Protractor will use this port. |
| app-dir | app | Source code will be generated here. |
| unit-test-dir | app | Unit tests will be generated here. |
| skip-controller | false | Should the route generator *skip* creating a controller? |
| skip-install | false | Should ng-flex skip installing Bower and npm dependencies? |

Example: `yo ng-flex --port=8080 --app-dir=src` to override the default port and app directory.

A **module-only** structure produces:
```
root/
├── app/
│   ├── fonts/ (empty)
│   ├── home/
│   │   ├── home-module.{coffee,es6,js,ts}
│   │   ├── home-routes.{coffee,es6,js,ts}
│   │   ├── home.{css,less,scss,styl}
│   │   ├── home.tpl.{haml,html,jade}
│   │   ├── home-controller.{coffee,es6,js,ts}
│   │   └── home-controller_test.{coffee,es6,js,ts}
│   ├── images/ (empty)
│   ├── app-module.{coffee,es6,js,ts}
│   ├── app-routes.{coffee,es6,js,ts}
│   └── index.{haml,html,jade}
├── bower_components/
├── e2e/
│   └── home/
│       ├── home.po.{coffee,es6,js}
│       └── home_test.{coffee,es6,js}
├── gulp/
│   ├── analyze.js
│   ├── build.js
│   ├── test.js
│   └── watch.js
├── node_modules/
├── typings/*
├── .bowerrc
├── .editorconfig
├── .eslintrc
├── .gitignore
├── .jscsrc
├── .jshintrc
├── .yo-rc.json
├── bower.json
├── build.config.js
├── Gulpfile.js
├── karma.config.js
├── package.json
├── protractor.config.js
├── README.md
└── tsd.json*
```

A **module-type** structure produces:
```
root/
├── app/
│   ├── fonts/ (empty)
│   ├── home/
│   │   ├── controllers/
│   │   │   ├── home-controller.{coffee,es6,js,ts}
│   │   │   └── home-controller_test.{coffee,es6,js,ts}
│   │   ├── views/
│   │   │   ├── home.{css,less,scss,styl}
│   │   │   └── home.tpl.{haml,html,jade}
│   │   ├── home-module.{coffee,es6,js,ts}
│   │   └── home-routes.{coffee,es6,js,ts}
│   ├── images/ (empty)
│   ├── app-module.{coffee,es6,js,ts}
│   ├── app-routes.{coffee,es6,js,ts}
│   └── index.{haml,html,jade}
├── bower_components/
├── e2e/
│   └── home/
│       ├── home.po.{coffee,es6,js}
│       └── home_test.{coffee,es6,js}
├── gulp/
│   ├── analyze.js
│   ├── build.js
│   ├── test.js
│   └── watch.js
├── node_modules/
├── typings/*
├── .bowerrc
├── .editorconfig
├── .eslintrc
├── .gitignore
├── .jscsrc
├── .jshintrc
├── .yo-rc.json
├── bower.json
├── build.config.js
├── Gulpfile.js
├── karma.config.js
├── package.json
├── protractor.config.js
├── README.md
└── tsd.json*
```
\* Only TypeScript projects will have this.
### Constant
Generates a constant and its test.

Example:
```
yo ng-flex:constant theHero
[?] Which module is this for?
```

Produces `app/module/the-hero-constant.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc service
   * @name module.constant:theHero
   *
   * @description
   *
   */
  angular
    .module('module')
    .constant('theHero', 0);
}());

```

Produces `app/module/the-hero-constant_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('theHero', function () {
  var constant;

  beforeEach(module('module'));

  beforeEach(inject(function (theHero) {
    constant = theHero;
  }));

  it('should equal 0', function () {
    expect(constant).toBe(0);
  });
});

```

### Controller
Genrates a controller and its test.

Example:
```
yo ng-flex:controller micro
[?] Which module is this for?
```

Produces `app/module/micro-controller.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc object
   * @name module.controller:MicroCtrl
   * @requires $scope
   *
   * @description
   *
   */
  angular
    .module('module')
    .controller('MicroCtrl', MicroCtrl);

  function MicroCtrl($scope) {
    $scope.micro = {};
    $scope.micro.ctrlName = 'MicroCtrl';
  }
}());

```

Produces `app/module/micro-controller_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('MicroCtrl', function () {
  var scope;

  beforeEach(module('module'));

  beforeEach(inject(function ($rootScope, $controller) {
    scope = $rootScope.$new();
    $controller('MicroCtrl', {$scope: scope});
  }));

  it('should have ctrlName as MicroCtrl', function () {
    expect(scope.micro.ctrlName).toEqual('MicroCtrl');
  });
});

```

### Decorator
Generates a decorator and its test.

Example:
```
yo ng-flex:decorator awesomeService
[?] Which module is this for?
```

**Note: If decorating a service starting with a `$` you must escape it like:**

`yo ng-flex:decorator \$state`

Produces `app/module/awesome-service-decorator.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc decorator
   * @name home.decorator:awesomeService
   * @restrict EA
   * @element
   *
   * @description
   *
   */
  angular
    .module('module')
    .config(decorator);

  function decorator($provide) {
    $provide.decorator('awesomeService', function ($delegate) {
      $delegate.simpleFunction = function () {
        return 'awesomeService';
      };
      return $delegate;
    });
  }
}());

```

Produces: `app/module/awesome-service-decorator_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('awesomeService', function () {
  var decorator;

  beforeEach(module('module'));

  beforeEach(inject(function (awesomeService) {
    decorator = awesomeService;
  }));

  it('should have simpleFunction return awesomeService', function () {
    expect(decorator.simpleFunction()).toEqual('awesomeService');
  });
});

```

### Directive
Generates a directive, its template, and its test.

Example:
```
yo ng-flex:directive fancy-button
[?] Which module is this for?
```

Produces `app/module/fancy-button-directive.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc directive
   * @name module.directive:fancyButton
   * @restrict EA
   * @element
   *
   * @description
   *
   * @example
     <example module="module">
       <file name="index.html">
        <fancy-button></fancy-button>
       </file>
     </example>
   *
   */
  angular
    .module('module')
    .directive('fancyButton', fancyButton);

  function fancyButton() {
    return {
      restrict: 'EA',
      scope: {},
      templateUrl: 'module/fancy-button-directive.tpl.html',
      replace: false,
      controller: function (scope) {
        scope.fancyButton = {};
        scope.fancyButton.name = 'fancyButton';
      },
      link: function (scope, element, attrs) {
        /*jshint unused:false */
        /*eslint "no-unused-vars": [2, {"args": "none"}]*/
      }
    };
  }
}());

```

Produces `app/module/fancy-button-directive.tpl.html`:
```html
<div>{{fancyButton.name}}</div>
```

Produces `app/module/fancy-button-directive_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('fancyButton', function () {
  var scope;
  var element;

  beforeEach(module('module', 'module/fancy-button-directive.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope) {
    scope = $rootScope.$new();
    element = $compile(angular.element('<fancy-button></fancy-button>'))(scope);
  }));

  it('should have correct text', function () {
    scope.$apply();
    expect(element.isolateScope().fancyButton.name).toEqual('fancyButton');
  });
});

```
**The directive's template (HAML, HTML, or Jade) is converted to a temporary module automatically for testing.**

### Factory
Generates a factory and its test.

Example:
```
yo ng-flex:factory cake
[?] Which module is this for?
```

Produces `app/module/cake-factory.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc service
   * @name module.factory:Cake
   *
   * @description
   *
   */
  angular
    .module('module')
    .factory('Cake', Cake);

  function Cake() {
    var CakeBase = {};
    CakeBase.someValue = 'Cake';
    CakeBase.someMethod = function () {
      return 'Cake';
    };
    return CakeBase;
  }
}());

```

Produces `app/module/Cake-factory_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Cake', function () {
  var factory;

  beforeEach(module('module'));

  beforeEach(inject(function (Cake) {
    factory = Cake;
  }));

  it('should have someValue be Cake', function () {
    expect(factory.someValue).toEqual('Cake');
  });

  it('should have someMethod return Cake', function () {
    expect(factory.someMethod()).toEqual('Cake');
  });
});

```

### Filter
Generates a filter and its test.

Example:
```
yo ng-flex:filter coffee
[?] Which module is this for?
```

Produces `app/module/coffee-filter.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc filter
   * @name module.filter:coffee
   *
   * @description
   *
   * @param {Array} input The array to filter
   * @returns {Array} The filtered array
   *
   */
  angular
    .module('module')
    .filter('coffee', coffee);

  function coffee() {
    return function (input) {
      var temp = [];
      angular.forEach(input, function (item) {
        if(item > 3) {
          temp.push(item);
        }
      });
      return temp;
    };
  }
}());

```

Produces `app/module/coffee-filter_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('coffee', function () {
  beforeEach(module('module'));

  it('should filter our numbers not greater than 3', inject(function ($filter) {
    expect($filter('coffee')([1,2,3,4])).toEqual([4]);
  }));
});

```

### Module
Generates a new module and create a new route. Updates parent module's dependencies.

**Top Level Example:**
```
yo ng-flex:module top
```

Produces `app/top/top-module.js`:
```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name top
   * @description
   *
   */
  angular
    .module('top', [
      'ui.router'
    ]);
}());

```

Produces `pp/top/top-routes.js`:
```javascript
(function () {
  'use strict';

  angular
    .module('top')
    .config(config);

  function config($stateProvider) {
    $stateProvider
      .state('top', {
        url: '/top',
        templateUrl: 'top/top.tpl.html',
        controller: 'TopCtrl'
      });
  }
}());

```

Produces `app/top/top-controller.js`, `app/top/top-controller_test.js`, `app/top/top.tpl.html`, `app/top/top.less`, `e2e/top/top.po.js`, `e2e/top/top_test.js`

Updates `app/app-module.js`:
```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name module
   * @requires $urlRouterProvider
   * @description
   *
   */
  angular
    .module('module', [
      'ui.router',
      'home',
      'top'
    ]);
}());

```

* * *

**Deep Level Example:**
```
yo ng-flex:module top/bottom
```

Produces `app/top/bottom/bottom-module.js`, `app/top/boottom/bottom-routes.js`, `app/top/bottom/bottom-controller.js`, `app/top/bottom/bottom-controller_test.js`, `app/top/bottom/bottom.tpl.html`, `app/top/bottom/bottom.less`, `e2e/bottom/bottom.po.js`, `e2e/bottom/bottom_test.js`

Updates `app/top/top-module.js`:
```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name top
   * @requires $stateProvider
   *
   * @description
   *
   */
  angular
    .module('top', [
      'ui.router',
      'top.bottom'
    ]);
}());

```

**Notice the module in `app/top/bottom/` is called 'top.bottom'. All tests in this directory use this nomenclature, as well.**

* * *
**Deeper Level Example:**
```
yo ng-flex:module top/bottom/bottomest
```

Produces 'bottom.bottomest' module and routes, a controller, controller test, style, and a view in `app/top/bottom/bottomest/`

Updates 'top.bottom' module with the new 'bottom.bottemest' module as a dependency.

* * *
**Deeperestier Level Example:**

It just keeps going...

* * *
**Empty modules**

By running `ng-flex:module newHome --empty` a module's routes file will **not** be created.

The module file will omit the router dependency:
```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name newHome
   *
   * @description
   *
   */
  angular
    .module('newHome', [
    ]);
}());

```

### Provider
Generates a provider and its test.

Example:
```
yo ng-flex:provider bacon
[?] Which module is this for?
```

Produces `app/module/bacon-provider.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc service
   * @name module.provider:Bacon
   *
   * @description
   *
   */
  angular
    .module('module')
    .provider('Bacon', Bacon);

  function Bacon() {
    return {
      $get: function () {
        return 'Bacon';
      }
    };
  }
}());

```

Produces `app/module/Bacon-provider_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('Bacon', function () {
  var provider;

  beforeEach(module('module'));

  beforeEach(inject(function (Bacon) {
    provider = Bacon;
  }));

  it('should equal Bacon', function () {
    expect(provider).toEqual('Bacon');
  });
});

```

### Route
Adds a new route and generates a controller and view. The name provided is used as state name for UI Router and as the route URL for ngRoute. Yeoman will then ask for the module to add the route to, the URL for the route (UI Router only), and the templateUrl. It will also generate an e2e test and a Page Object model for the new route.

Example:
```
yo ng-flex:route your-place
[?] Which module is this for?
[?] What's the URL for this route? (UI Router only)
[?] What's the templateURL for this route?
```

Updates `app/module/module-module.js`:
```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name module
   * @requires $stateProvider
   *
   * @description
   *
   */
  angular
    .module('module', [
      'ui.router'
    ]);

  angular
    .module('module')
    .config(config);

  function config($stateProvider) {
    $stateProvider
      .state('module', {
        url: '/module',
        templateUrl: 'module/module.tpl.html',
        controller: 'ModuleCtrl'
      })
      .state('yourPlace', {
        url: '/yourPlace',
        templateUrl: 'module/your-place.tpl.html',
        controller: 'YourPlaceCtrl'
      });
  }
}());

```

Produces `e2e/your-place/your-place.po.js`:
```javascript
/*global element, by*/
'use strict';

var YourPlacePage = function () {
  this.text = element(by.tagName('p'));
  this.heading = element(by.tagName('h2'));
};

module.exports = YourPlacePage;
```

Produces `e2e/your-place/your-place_test.js`:
```javascript
/*global describe, beforeEach, it, browser, expect */
'use strict';

var buildConfigFile = require('findup-sync')('build.config.js')
  , buildConfig = require(buildConfigFile)
  , YourPlacePagePo = require('./your-place.po');

describe('Your place page', function () {
  var yourPlacePage;

  beforeEach(function () {
    yourPlacePage = new YourPlacePagePo();
    browser.driver.get(buildConfig.host + ':' + buildConfig.port + '/#/yourPlace');
  });

  it('should say YourPlaceCtrl', function () {
    expect(yourPlacePage.heading.getText()).toEqual('yourPlace');
    expect(yourPlacePage.text.getText()).toEqual('YourPlaceCtrl');
  });
});

```

Produces `app/module/your-place-controller.js`, `app/module/your-place-controller_test.js`, `app/module/your-place.tpl.html`, and `app/module/your-place.less`

**Currently, the module must have an existing state for another to be added.**

* * *
The route generator can take URL and templateUrl options, as well.
```
yo ng-flex:route yourPlace --url=yourPlace --template-url=your-place
```
The URL will automatically be prepended with `/` and and the templateUrl will be appended with `.tpl.html`.
* * *

### Service
Generates a service and its test.

Example:
```
yo ng-flex:service cheap-or-good
[?] Which module is this for?
```

Produces `app/module/cheap-or-good-service.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc service
   * @name home.service:CheapOrGood
   *
   * @description
   *
   */
  angular
    .module('module')
    .service('CheapOrGood', CheapOrGood);

  function CheapOrGood() {
    var self = this;

    self.get = function get() {
      return 'CheapOrGood';
    };
  }
}());

```

Produces `app/module/cheap-or-good-service_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('CheapOrGood', function () {
  var service;

  beforeEach(module('module'));

  beforeEach(inject(function (CheapOrGood) {
    service = CheapOrGood;
  }));

  it('should equal CheapOrGood', function () {
    expect(service.get()).toEqual('CheapOrGood');
  });
});

```

### Value
Generates a value and its test.

Example:
```
yo ng-flex:value morals
[?] Which module is this for?
```

Produces `app/module/morals-value.js`:
```javascript
(function () {
  'use strict';

  /**
   * @ngdoc service
   * @name module.constant:morals
   *
   * @description
   *
   */
  angular
    .module('module')
    .value('morals', 0);
}());

```

Produces `app/module/morals-value_test.js`:
```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('morals', function () {
  var value;

  beforeEach(module('module'));

  beforeEach(inject(function (morals) {
    value = morals;
  }));

  it('should equal 0', function () {
    expect(value).toBe(0);
  });
});

```

### View
Generates a view and its style.

Example:
```
yo ng-flex:view nice
[?] Which module is this for?
```

Produces `app/module/nice-view.tpl.html`:
```html
<h2>nice</h2>
<p>{{nice.ctrlName}}</p>
```

Produces an empty file `app/module/nice-view.less`

* * *

### Element
Generates a Polymer element.

Example:
```
yo ng-flex:element gold-silver
```

Produces `app/components/gold-silver/gold-silver.less`:
```css
:host {
  height: 100px;
  width: 100px;
  display: inline-block;
}
```

Produces `app/components/gold-silver/gold-silver.html`:
```html
<link rel='import' href='../polymer/polymer.html'>

<polymer-element name='gold-silver'>
  <template>
    <link rel='stylesheet' href='gold-silver.css'>
    <div>{{name}}</div>
  </template>

  <script src='gold-silver.js'></script>
</polymer-element>
```

Produces `app/components/gold-silver/gold-silver.js`:
```javascript
/*global Polymer*/
(function () {
  'use strict';

  var element = new Polymer('gold-silver', {
    name: 'gold-silver',
    domReady: function () {
      console.log('gold-silver');
    }
  });

  return element;
}());
```

* * *

## Configurations

It is possible to override the configurations initially specified when `yo ng-flex` was run.

Each generator is able to take the following arguments. For example, `yo ng-flex:module test --controller-as=true --markup=jade` will override the configuration settings for everything generated by this command.

| Option | Possible Values|
| ------ | -------------- |
| app-script | coffee, es6, js, ts |
| markup | haml, html, jade|
| style | css, less, scss, styl|
| test-script | coffee, es6, js, ts |
| controller-as | true, false |
| skip-controller | true, false |
| ng-route | true, false|

**It's not recommended to mix ngRoute and UI Router, but it's possible.**

### Controller As Syntax

This generator has support for the Controller As syntax. Yeoman will ask if this should be enabled when `ng-flex:app` is run.

This will generate controllers like:

```javascript
(function () {
  'use strict';

  /**
   * @ngdoc object
   * @name home.controller:HomeCtrl
   *
   * @description
   *
   */
  angular
    .module('home')
    .controller('HomeCtrl', HomeCtrl);

  function () {
    var vm = this;
    vm.ctrlName = 'HomeCtrl';
  }
}());
```

...and their tests like:

```javascript
/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('HomeCtrl', function () {
  var ctrl;

  beforeEach(module('home'));

  beforeEach(inject(function ($rootScope, $controller) {
    ctrl = $controller('HomeCtrl');
  }));

  it('should have ctrlName as HomeCtrl', function () {
    expect(ctrl.ctrlName).toEqual('HomeCtrl');
  });
});

```

It'll also modify the state's controller like:

```javascript
(function () {
  'use strict';

  /* @ngdoc object
   * @name home
   * @requires $stateProvider
   *
   * @description
   *
   */
  angular
    .module('home', [
      'ui.router'
    ]);

  angular
    .module('home')
    .config(config);

  function config($stateProvider) {
    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl: 'home/home.tpl.html',
        controller: 'HomeCtrl as home'
      });
  }
}());

```

Directives will be generated like:

```javascript
(function () {
  'use strict';

  /**
   * @ngdoc directive
   * @name home.directive:fancyButton
   * @restrict EA
   * @element
   *
   * @description
   *
   * @example
     <example module="home">
       <file name="index.html">
        <fancy-button></fancy-button>
       </file>
     </example>
   *
   */
  angular
    .module('home')
    .directive('fancyButton', fancyButton);

  function fancyButton() {
    return {
      restrict: 'EA',
      scope: {},
      templateUrl: 'home/fancy-button-directive.tpl.html',
      replace: false,
      controllerAs: 'fancyButton',
      controller: function () {
        var vm = this;
        vm.name = 'fancyButton';
      },
      link: function (scope, element, attrs) {
        /*jshint unused:false */
        /*eslint "no-unused-vars": [2, {"args": "none"}]*/
      }
    };
  }
}());

```

Lastly, views will be generated like:

```html
<h2>home</h2>
<p>{{home.ctrlName}}</p>
```

* * *

## Gulp Tasks in Detail

*Items in italics are only run in --stage=prod*

Available tasks:
- `gulp` or `gulp default`
 - Runs `gulp dev`
- `gulp dev`
 - Runs `gulp build` and starts BrowserSync and Gulp's watch
- `gulp build`
 - Runs `gulp analyze`
 - Runs `gulp clean` to delete build directory
 - Runs `gulp markup` to compile Haml and Jade to HTML
 - Runs `gulp styles` to compile Less, SCSS, and Stylus (with Nib), add vendor prefixes, *modify images and font URLs*, *concat*, *minify*, and *rev*
 - Runs `gulp scripts` to compile ES2015, CoffeeScript, and TypeScript, *injects HTML templates in $templateCache*, *sorts Angular files*, *annotates*, *minifies*, and *rev*
 - Runs `gulp inject` to inject sorted JS and CSS source files into build/index.html
 - Runs `gulp bowerCopy` to *modify image and font URLs in vendor CSS files*, *concat vendor CSS*, *minify vendor CSS*, *rev vendor CSS*, copy vendor CSS to build, *concat vendor JS*, *minify vendor JS and leave licenses intact*, copy vendor JS to build
 - Runs `gulp bowerInject` to inject vendor CSS and JS into build/index.html
 - Runs `gulp bowerAssets` to copy over any vendor image and fonts to build/
 - Runs `gulp fonts` to copy app fonts to build/
 - Runs `gulp images` to copy app images to build/
 - Runs `gulp copyTemplates` to copy compiled templates to a separate test directory used for unit testing
 - Runs `gulp deleteTemplates` to *delete templates in build*
- `gulp unitTest`
 - Runs `gulp lint`
 - Runs `gulp clean:test` to delete previous compiled unit tests
 - Runs `gulp buildTests` to compile CoffeeScript, ES2015, and TypeScript unit tests
 - Runs `gulp build`
 - Runs `gulp karmaFiles` to automatically configure Bower dependencies, directive templates, sorted build JS files, and unit tests for Karma
 - Run unit tests with Karma
- `gulp e2eTest`
 - Runs `gulp lint`
 - Runs `gulp build`
 - Runs `gulp build:e2eTest` to compile CoffeeScript, ES2015, and TypeScript tests
 - Runs Protractor to perform e2eTest (**app needs to be running via `gulp default`**)
- `gulp webdriverUpdate` downloads Selenium and webdrivers for e2e testing
- `gulp analyze`
 - Analyzes source and test code with CoffeeLint, ESLint, JSHint, and JSCS
 - Uses Plato to inspect source and test for complexity and maintainability

* * *

### License

MIT
