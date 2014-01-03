'use strict'

describe 'Service: linkedIn', ->
  windowMock = 
    IN:
      API:
        Profile: (string) ->
          if string is 'me'
              fields: (fields) ->
                result: (callback) ->
                  callback {response: 'response'}
  linkedIn = {}
  callback = jasmine.createSpy 'callback'

  beforeEach ->
    module 'portfolioApp'
    module ($provide) ->
      $provide.value '$window', windowMock
      null
    
    inject (_linkedIn_) ->
      linkedIn = _linkedIn_

  afterEach ->
    callback.reset()

  it 'should contain an linkedIn service', ->
    expect(linkedIn).not.toBe null

  it 'should register a callback function and call it when log method is called', ->
    linkedIn.regCallback callback
    linkedIn.log()
    expect(callback).toHaveBeenCalled()

  it 'should return true once log method has been called', ->
    linkedIn.log()
    expect(linkedIn.isLogged()).toBe true

  it 'should call to real linkedin api and pass the result to the given function', ->
    linkedIn.getProfile callback
    expect(callback).toHaveBeenCalledWith {response: 'response'}