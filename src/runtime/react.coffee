transform = require('../transformer')
Node = require('../node')

React = null
module.exports = runtime = (block, options = {}) ->
  React = options.runtime ? global.React

  ast = transform(block)
  convert ast

# ast to react element
convert = (element) ->
  if element instanceof Node
    {element, props, children, text} = element
    React.createElement element, props, (
      text ? children.map (child) -> convert(child)
    )
  else
    element
