Node = require './node'

# template function to ast
module.exports = transform = do ->
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
