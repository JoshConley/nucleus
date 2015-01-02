# Angular Common
require 'bower/angular'
require 'bower/angular-route'
require 'bower/angular-resource'
require 'bower/ngstorage'
require 'bower/angular-socket-io'

# Styles
require './styles.scss'

# Init app
components = [
  require './common/authentication'
  require './common/accesses'
  require './common/header/directive'
  require './common/realtime'
  require './account'
  require './places'
  require './spaces'
  require './devices'
]

dependencies = [
  'ngRoute',
  'ngResource'
  'ngStorage'
  'btford.socket-io'
]

# Add defined compentents to dependencies
for component in components
  dependencies.push component.name

app = angular.module 'nucleus', dependencies

# Routes
app.config ($routeProvider) ->
  $routeProvider
    .when '/account/login',
      controller: 'accountCtrl'
      templateUrl: 'account/login/view.html'
    .when '/account/signup',
      controller: 'accountCtrl'
      templateUrl: 'account/signup/view.html'
    .when '/places',
      controller: 'placesCtrl'
      templateUrl: 'places/view.html'
    .when '/places/:placeId',
      controller: 'spacesCtrl'
      templateUrl: 'spaces/view.html'
    .when '/places/:placeId/spaces/new',
      controller: 'spacesNewCtrl'
      templateUrl: 'spaces/new/view.html'
    .otherwise
      redirectTo: '/places'