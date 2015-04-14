global.React = require 'react'
runtime = require '../src/coppe'

describe 'runtime', ->
  it 'should parse block', ->
    el = runtime ($) ->
      $ 'div', {}, 'hello'
      $ 'ul', {}, ->
        for i in [1..5]
          $ 'li', {}, i.toString()

    console.log React.renderToStaticMarkup(el)

  it 'return first element if node count is one', ->
    el = runtime ($) ->
      $ 'ul', {}, ->
        for i in [1..2]
          $ 'li', {}, i.toString()

    console.log React.renderToStaticMarkup(el)

