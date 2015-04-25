global.m = require 'mithril'
global.deku = require 'deku'
global.React = require 'react'
global.hg = require 'mercury'
global.h = hg.h

template = (props) -> ($) ->
  onClick = -> console.log 'clicked', props.title

  $ 'div', {}, ->
    $ "h2", {id: 'foo', className: "xxx"}, 'Rendered by ' + props.title
    $ "button", {onClick}, "click me"
    $ "ul", {}, ->
      for i in [1, 2, 3]
        $ "li", {}, "item"

window.addEventListener 'DOMContentLoaded', ->
  m.render(
    document.querySelector('#mithril')
    require('../runtime/mithril')(template(title: 'mithril'))
  )

  React.render(
    require('../runtime/react')(template(title: 'react'))
    document.querySelector('#react')
  )

  hg.app(
    document.querySelector('#mercury')
    hg.state({})
    -> require('../runtime/mercury')(template(title: 'mercury'))
  )

  # today's deku is undocumented. Wait for it.
  # deku.render(
  #     require('../runtime/deku')(template(title: 'deku'))
  # ).render document.querySelector('#deku')
