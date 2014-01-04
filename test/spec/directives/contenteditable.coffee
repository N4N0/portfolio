'use strict'

describe 'Directive: contenteditable', () ->

  # load the directive's module
  beforeEach module 'portfolioApp'

  scope = {}
  element = {}
  beforeEach inject ($controller, $rootScope, $compile) ->
    scope = $rootScope.$new()
    element = angular.element '<div contenteditable ng-model="model"></Div>'
    element = $compile(element) scope
    scope.$apply -> scope.model = "Model content"

  it 'should set the value of the model as the initial content of the element ', -> 
    expect(element.text()).toBe 'Model content'

  it 'should set the value of the model as the content of the element ', -> 
    scope.$apply -> scope.model = "Modified model content"
    expect(element.text()).toBe 'Modified model content'

  it 'should set the element content as the value of the model', ->
    element.html "Modified model content"
    element.triggerHandler('blur')
    expect(scope.model).toBe "Modified model content"
