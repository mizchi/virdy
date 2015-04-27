transform = require('../transformer')
Node = require('../node')

deku = null
dom = null

module.exports = runtime = (block, options = {}) ->
  deku = options.runtime ? global.deku
  dom = deku.dom
  ast = transform(block)
  convert ast

convert = (element) ->
  if element instanceof Node
    {element, props, children, text} = element
    if element is '_t' then text
    else
      dom element, props, (
        text ? children.map (child) -> convert(child)
      )
  else
    element
