module.exports = runtime = (block) ->
  ast = transform(block)
  convert ast

# template function to ast
transform = do ->
  class Node
    constructor: (@element, @props, @text) ->
      @children = []
    addChild: (node) ->
      @children.push node

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

  (block) ->
    ctx = new Node 'div', {className: 'template-root'}
    block($)
    if ctx.children.length is 1
      return ctx.children[0]
    else
      ctx

# ast to react element
convert = ({element, props, children, text}) ->
  React.createElement element, props, (
    text ? children.map (child) -> convert(child)
  )

