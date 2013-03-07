App.directive 'navLink', ['$location', ($location) ->
  (scope, element, attrs) ->
    scope.$on '$routeChangeSuccess', ->
      href = attrs.href
      path = $location.path()
      li   = element.parent('li')
      li.toggleClass('active', href == path)
]
