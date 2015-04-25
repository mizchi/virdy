transform = require('../transformer')
Node = require('../node')

h = null
module.exports = runtime = (block, options = {}) ->
  h = options.runtime ? global.h
  ast = transform(block)
  convert ast

modifyProps = (props) ->
  newProps = {}
  for key, val of props
    _key = if key.indexOf('on') is 0 then key.toLowerCase() else key
    newProps[_key] = val
  newProps

# ast to react element
convert = (element) ->
  if element instanceof Node
    {element, props, children, text} = element
    h element, modifyProps(props), (
      text ? children.map (child) -> convert(child)
    )
  else
    element
