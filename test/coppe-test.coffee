global.React = require 'react'
runtime = require '../runtime/react'

describe 'runtime', ->
  it 'should parse block', ->
    el = runtime ($) ->
      $ 'div', {}, 'hello'
      # $ '_', {}, 'text'
      $.text 'foo'
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

  it 'should embed by $.direct', ->
    el = runtime ($) ->
      div = React.createElement 'div'
      $.direct div
    console.log React.renderToStaticMarkup(el)

  it 'should embed by $.text', ->
    el = runtime ($) ->
      $ 'div', {}, =>
        # $.text '&nbsp;'
        $.text ' '
    console.log React.renderToStaticMarkup(el)
