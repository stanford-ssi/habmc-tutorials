# Properties
React components are way spicier, of course, than just a collection of html.
They're _dynamic_ html.
This means that we can pass in a set of properties that the component can use when it renders itself.
Let's start by creating a new component, called Leader, and just have it render an empty `<td></td>` tag. 

Have you done so?
Good.
You should have something in `app/javascript/main/pages/leadership/leader.js.jsx` that looks like
```jsx harmony
import React from 'react'

export default class Leader extends React.Component {

    render() {
        return (
            <td></td>
        )
    }

}
```

Let's now make it have a property called `name`.

# Adding PropTypes
The first thing to do is mark it as a PropType. 
While not technically required, this really helps debugging and reliability.
First, at the top of the file, import PropTypes
```jsx harmony
import PropTypes from 'prop-types'
```

Then, at the bottom, say what properties it has a property called `name` with type `string` that's always required.
```jsx harmony
Leader.propTypes = {
    name: PropTypes.string.isRequired
};
```

# Using the name property
There's no point in having a name property if we don't use it.
Change the render function to return
```jsx harmony
<td>
    Hi, I'm {this.props.name}
</td>
```

This will do exactly what you think: if the name is `Hector`, it will render `<td>Hi, I'm Hector</td>`.

# A consideration about speed
One minor note is that we should replace `React.Component` with `React.PureComponent`.
The difference is that PureComponent only does shallow comparison of its properties to know when to re-render.
This makes it much faster.
In general, we're almost never going to mutate our properties, so we should almost always just use PureComponent.  
You can read more about the difference at [https://codeburst.io/when-to-use-component-or-purecomponent-a60cfad01a81](https://codeburst.io/when-to-use-component-or-purecomponent-a60cfad01a81).

# Using our new Leader component
Head back to `leadership_table.jsx`.
At the top, import the `Leader` component with `import Leader from './leader.js'`.
Then, you can create new Leader elements by making your render function look like:

```jsx harmony
    render() {
        return (
            <table>
                <tr>
                    <Leader name="Hector" />
                    <Leader name="Michael" />
                    <Leader name="Kai" />
                </tr>
            </table>
        )
    }
```

Once you've tested it out to be sure I haven't fucked up my untested code, head over to [Step 5](react-on-main-05.md)