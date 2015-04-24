module.exports = class Node
  constructor: (@element, @props, @text) ->
    @children = []

  addChild: (node) ->
    @children.push node
