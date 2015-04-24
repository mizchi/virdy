transform = require('../transformer')
Node = require('../node')

m = null
module.exports = runtime = (block, options = {}) ->
  m = options.runtime ? global.m
  ast = transform(block)
  convert ast

# ast to react element
convert = (element) ->

  if element instanceof Node
    {element, props, children, text} = element
    m element, props, (
      text ? children.map (child) -> convert(child)
    )
  else
    element
