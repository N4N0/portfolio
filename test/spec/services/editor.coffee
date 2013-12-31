'use strict'

describe 'Service: Editor', () ->

  # load the service's module
  beforeEach module 'portfolioApp'

  # instantiate service
  Editor = {}
  beforeEach inject (_Editor_) ->
    Editor = _Editor_

  it 'should do something', () ->
    expect(!!Editor).toBe true
