'use strict'

describe 'Controller: AppCtrl', ->

  linkedInMock =
    log: jasmine.createSpy('log')
  
  AppCtrl = {}
  scope = {}

  beforeEach ->
    module 'portfolioApp'
    module ($provide) ->
      $provide.value 'linkedIn', linkedInMock
      null
    
    inject ($controller, $rootScope) ->
      scope = $rootScope.$new()
      AppCtrl = $controller 'AppCtrl', $scope: scope

  it 'should contain AppCtrl controller', ->
    expect(AppCtrl).not.toBe null
  
  it 'should call to the linkedIn log method', ->
    scope.initLinkedIn()
    expect(linkedInMock.log).toHaveBeenCalled()