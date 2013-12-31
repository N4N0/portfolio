'use strict'

angular.module('portfolioApp')
.controller 'MainCtrl', ['$scope', '$http', 'linkedIn', ($scope, $http, linkedIn) ->
	
	authCallback = ->
		linkedIn.getProfile (data) ->
			$scope.profile = data.values[0]
			$scope.$apply() unless $scope.$$phase is '$apply' or $scope.$$phase is '$digest'
	
	linkedIn.regCallback authCallback

	$scope.hiddenPositions = []
	$scope.hiddenEducations = []
	$scope.hiddenSkills = []

	$scope.hide = (item, hiddenArray) ->
		item.hide = true
		hiddenArray.push item
		console.log hiddenArray
	
	$scope.show = (item, index, hiddenArray) ->
		item.hide = false
		hiddenArray.splice index, 1

]
