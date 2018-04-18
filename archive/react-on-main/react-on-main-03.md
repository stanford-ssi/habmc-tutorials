# Components
Components are the fundamental building block of any React app.
In normal HTML, you can have simple elements like a `<div>` or a `<table>`.
A component in React is a combination of a number of these elements.
Let's do an example to see how it works.

Create some new folders so that you have the structure `app/javascript/main/pages/leadership`, and in that folder, create a file called `leadership_table.js.jsx`. 
This folder structure is just so that the code stays well-organized throughout the future -- we really could have it elsewhere if we wanted.
The `.js.jsx` file extension registers it as a JSX Harmony file. 
This is nice because it lets us embed html within the javascript.

In `leadership_table.js.jsx`, write the following code:
```jsx harmony
import React from 'react'

export default class LeadershipTable extends React.Component {

    render() {
        return (
            <table>
                <tr>
                    <th>Hi</th>
                    <td>There</td>
                </tr>
            </table>
        )
    }

}
```

Let's dissect this.
- `import React from 'react'` just imports the React library so that we can use it
- `class LeadershipTable extends React.Component` defines a new class called LeadershipTable. It also makes it inherit from the class React.Component, so it will have all the abilities of the superclass. 
- `export` lets us import the class into other files, and `default` marks it as the default thing imported from that file.
- `render() { /* code */ }` defines a new method on the class called render. 
- `return (<table></table>)` returns the html for a table.

Now, any time we want, we can render a `<LeadershipTable />` element, and it will produce the given html.
Let's try that out to make sure that it works.

# Rendering the component

```jsx harmony
import React from 'react'
import ReactDOM from 'react-dom'
import LeadershipTable from "../main/pages/leadership/leadership_table.js";

document.addEventListener('turbolinks:load', () => {
    if (!document.getElementById('leadership-react-root')) {
        return;
    }
    
    ReactDOM.render(
        <LeadershipTable />,
        document.getElementById('leadership-react-root')
    )
});
```

Let's again go through this code to understand it in depth
- `import` all the import statements import a library for use. We can either import from installed libraries (which are installed using something called yarn -- we'll get to it eventually) or from local files, like our leadership table file.
- `document.addEventListener('turbolinks:load', () => { /* code */ });` adds a listener for the event called `turbolinks:load`. In frontend programming, there are lots of events that can be produced, like the click event when an element is clicked or the change event when an input changes. `turbolinks:load` is an event that gets triggered whenever the page loads. When it happens, the listener we just set up runs the code in `() => { /* code */ }`. (`() => {}` is shorthand for `function(){ }`)
- 
```jsx harmony
    if (!document.getElementById('leadership-react-root')) {
        return;
    }
``` 
checks to see if the element with id leadership-react-root exists.
If it doesn't, it returns. 
This is because we want to use this element below, and we don't want to pass something that doesn't exist
- 
```jsx harmony
    ReactDOM.render(
        <LeadershipTable />,
        document.getElementById('leadership-react-root')
    )
``` 
goes ahead and renders it on the page.
The first argument is what to render -- our LeadershipTable -- and the second is the react root element.

# Test it
You heard the header!
Go to the [http://localhost:3000/leadership](http://localhost:3000/leadership) and see if it renders a table that says Hi There.

Once it does, go on to [Step 4](react-on-main-04.md)