'use strict'

angular.module('portfolioApp')
.service 'linkedIn', ['$http', '$window',($http, $window) ->
	logged = false
	fields = [
		'firstName',
		'lastName',
		'positions',
		'skills',
		'educations',
		'headline',
		'pictureUrl',
		'summary',
		'email-address',
		'languages'
	]
	regCallback = null
	
	isLogged: ->
		logged
	
	log: ->
		logged = true
		regCallback() if regCallback

	regCallback: (callback) ->
		regCallback = callback

	getProfile: (callback)->
		$window.IN.API.Profile('me').fields(fields).result (data) ->
			callback data

    # AngularJS will instantiate a singleton by calling "new" on this function
]