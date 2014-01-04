'use strict'

describe 'Controller: MainCtrl', ->

  linkedInMock =
    callback: {}
    regCallback: (callback) ->
      @callback = callback
    getProfile: (callback) ->
      callback
        values: ['values']
    flush: ->
      @callback()
    reset: ->
      @callback = {}
  
  MainCtrl = {}
  scope = {}

  beforeEach ->
    module 'portfolioApp'
    module ($provide) ->
      $provide.value 'linkedIn', linkedInMock
      null
    
    spyOn(linkedInMock, 'regCallback').andCallThrough()
    spyOn(linkedInMock, 'getProfile').andCallThrough()

    inject ($controller, $rootScope) ->
      scope = $rootScope.$new()
      MainCtrl = $controller 'MainCtrl', $scope: scope
  
  afterEach ->
    linkedInMock.regCallback.reset()
    linkedInMock.getProfile.reset()
    linkedInMock.reset()

  it 'should init the controller', ->
    expect(linkedInMock.regCallback).toHaveBeenCalled()

  it 'should call to getProfile when linkedIn service flush', ->
    linkedInMock.flush()
    expect(linkedInMock.getProfile).toHaveBeenCalledWith jasmine.any Function

  it 'should set scope.profile', ->
    linkedInMock.flush()
    expect(scope.profile).toBe 'values'