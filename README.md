# Coppe

```
npm install coppe --save-dev
```

Handy raect DSL

```js
let element = coppe($ => {
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
declare function coppe($:(
  element: string | ReactComponent,
  props: Object,
  textOrBlock: string | Function
) => void): ReactElement
```

## Runtime(experimental)

```
require('coppe/runtime/deku')
require('coppe/runtime/mithril')
require('coppe/runtime/react')
require('coppe/runtime/virtual-dom')
```
