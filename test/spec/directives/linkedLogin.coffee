'use strict'

describe 'Directive: linkedLogin', () ->

  # load the directive's module
  beforeEach module 'portfolioApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<linked-login></linked-login>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the linkedLogin directive'
