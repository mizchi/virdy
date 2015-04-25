# Virdy

```
npm install virdy --save-dev
```

Handy virtual dom DSL for React / Mithril / Mercury


```js
const virdy = require('virdy')
let element = virdy($ => {
  $('div', {className: 'root'}, () => {
    $('ul', {className: 'itemWrapper'}, () => {
      [1, 2, 3].map(i => {
        $('li', {}, 'item:' + i.toString());
      });
    });
  });
});

React.render(element, document.body);
```

```typescript
declare function virdy($:(
  element: string | ReactComponent,
  props: Object,
  textOrBlock: string | Function
) => void): ReactElement
```

## React / Mithril / Mercury

coffeescript example

```coffee
global.m = require 'mithril'
global.React = require 'react'
global.hg = require 'mercury'
global.h = hg.h

template = (props) -> ($) ->
  onClick = -> console.log 'clicked', props.title
  $ 'div', {}, ->
    $ "h2", {id: 'foo', className: "xxx"}, 'Rendered by ' + props.title
    $ "button", {onClick}, "click me"
    $ "ul", {}, ->
      for i in [1, 2, 3]
        $ "li", {}, "item"

window.addEventListener 'DOMContentLoaded', ->
  m.render(
    document.querySelector('#mithril')
    require('virdy/runtime/mithril')(template(title: 'mithril'))
  )

  React.render(
    require('virdy/runtime/react')(template(title: 'react'))
    document.querySelector('#react')
  )

  hg.app(
    document.querySelector('#mercury')
    hg.state({})
    -> require('virdy/runtime/mercury')(template(title: 'mercury'))
  )
```

## LICENSE

MIT
