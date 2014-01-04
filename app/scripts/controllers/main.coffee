'use strict'

angular.module('portfolioApp')
  .controller 'MainCtrl', ['$scope', '$http', 'linkedIn', ($scope, $http, linkedIn) ->
    
    templates =
      position:
        company:
          name: "Empresa"
        title: "Puesto profesional"
        summary: "Descripción"
      education:
        degree: "Titulo"
        schoolName: "Institución"
      skill:
        skill:
          name: "aptitud"

    authCallback = ->
      linkedIn.getProfile (data) ->
        if data and data.values and data.values[0]  
          $scope.profile = data.values[0]
          $scope.$apply() unless $scope.$$phase is '$apply' or $scope.$$phase is '$digest'
    
    linkedIn.regCallback authCallback

    $scope.new = (type, array) ->
      array.unshift angular.copy templates[type]
  ]