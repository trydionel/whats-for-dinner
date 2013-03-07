#= require angular
#= require angular-resource
#= require_self
#= require_tree

window.App = angular.module 'WhatsForDinner', ['ngResource']

App.config ['$httpProvider', ($httpProvider) ->
  token = document.querySelector('meta[name=csrf-token]').content
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = token
]
