'use strict'

angular.module('portfolioApp')
.controller 'AppCtrl', ['$scope', 'linkedIn', ($scope, linkedIn) ->
	$scope.initLinkedIn = ->
		linkedIn.log()
]