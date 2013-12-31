'use strict'

describe 'Service: Linkedin', () ->

  # load the service's module
  beforeEach module 'portfolioApp'

  # instantiate service
  Linkedin = {}
  beforeEach inject (_Linkedin_) ->
    Linkedin = _Linkedin_

  it 'should do something', () ->
    expect(!!Linkedin).toBe true
