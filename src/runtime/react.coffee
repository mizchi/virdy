transform = require('../transformer')
Node = require('../node')

React = null
module.exports = runtime = (block, options = {}) ->
  React = options.runtime ? global.React

  ast = transform(block)
  convert ast

# ast to react element
convert = (el) ->
  if el instanceof Node
    console.log el
    {element, props, children, text} = el
    if element is '_t'
      text
    else
      React.createElement element, props, (
        text ? children.map (child) -> convert(child)
      )
  else
    el
