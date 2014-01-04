'use strict'

angular.module('portfolioApp')
  .directive 'contenteditable', ->
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attrs, ctrl) ->
      element.on 'blur', ->
        scope.$apply ->
          ctrl.$setViewValue element.html()
      ctrl.$render = ->
        element.html ctrl.$viewValue
      element.html ctrl.$viewValue if ctrl.$viewValue
