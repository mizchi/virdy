transform = require('../transformer')
Node = require('../node')

h = null
module.exports = runtime = (block, options) ->
  h = options.runtime ? global.h

  ast = transform(block)
  convert ast

# ast to react element
convert = (element) ->
  if element instanceof Node
    {element, props, children, text} = element
    h element, props, (
      text ? children.map (child) -> convert(child)
    )
  else
    element
