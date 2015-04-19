module.exports = runtime = (block) ->
  ast = transform(block)
  convert ast

class Node
  constructor: (@element, @props, @text) ->
    @children = []
  addChild: (node) ->
    @children.push node

# template function to ast
transform = do ->
  ctx = null
  $ = (element, props, textOrBlock) ->
    node = null
    switch typeof textOrBlock
      when 'function'
        node = new Node element, props, null
        ctx.addChild node
        _tmp = ctx # save
        ctx = node
        textOrBlock()
        ctx = _tmp # restore
      else
        node = new Node element, props, textOrBlock
        ctx.addChild node
    null

  $.direct = (el) ->
    ctx.addChild el

  (block) ->
    ctx = new Node 'div', {className: '__wrapper'}
    block($)
    if ctx.children.length is 1
      return ctx.children[0]
    else
      ctx

# ast to react element
convert = (element) ->
  if element instanceof Node
    {element, props, children, text} = element
    React.createElement element, props, (
      text ? children.map (child) -> convert(child)
    )
  else
    element
