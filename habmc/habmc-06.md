Let's make a frontend. 
HABMC uses [React](https://facebook.github.io/react/). 
There are lots of great React tutorials out there, but React can be summed up as a system for making custom elements.
For example, you could have code that looks like
```jsx harmony

class Hello {
    
    render() {
        return (
            <div>
                <h1>Hi {name}</h1>
                <p>How are you?</p>
            </div>  
        );
    }
    
}

class Page {
    render() {
        return (
            <div>
                <Hello name="John Bean" />
                <Hello name="P Dog" />
            </div>
        )
    }
}

```

When Page is rendered, it will create HTML that looks like
```html
<div>
    <div>
        <h1>Hi John Bean</h1>
        <p>How are you?</p>
    </div>
    <div>
        <h1>Hi P Dog</h1>
        <p>How are you?</p>
    </div>
</div>
```

## Making our own Page
Brace yourself for a ridiculously long path: app/assets/javascripts/components/habmc/pages/tutorial_messages_page.js.jsx
That's the file in which we should create a new page.

Let's make it a skeleton for now:
```jsx harmony
class TutorialMessagesPage extends React.Component {

    shouldComponentUpdate(nextProps, nextState){
        return false;
    }
    
    render(){
        return (
            <h1>Hi!</h1>
        )      
    }
    
}

TutorialMessagesPage.propTypes = {
    
};
```

We're saying:
- Create a new kind of component, called TutorialMessagesPage
- It never needs to update (because nothing in it will change)
- When it renders, it should just make a heading that says Hi
- It doesn't have any properties

## Make it able to be displayed
Frontend routing is done in app/assets/javascripts/components/habmc/app.js.jsx.
You can see a big set of configuration:
```jsx harmony
const pages = {
    dashboard: DashboardPage,
    // lots of other things
}
```

Add a line at the bottom of it:
```jsx harmony
tutorial_messages: TutorialMessagesPage
```
(Don't forget to add a comma at the end of the previous line)

Now if you go to [http://localhost:3000/#tutorial_messages](http://localhost:3000/#tutorial_messages), you'll see it say hi.

## Link to it in the sidebar
We also want to see it in the sidebar.
We need to edit the massive config variable in app/assets/javascripts/components/habmc/layout/sidebar/sidebar.js.jsx.
Right under the thing that says `text: "Communications", heading: true`, add
```js
{
    "text": "Tutorial Messages",
    "sref": "tutorial_messages",
    "icon": "fa fa-handshake-o"
},
```

- "text" controls the text displayed in the sidebar
- "sref" sets what it links to. In this case, we put `tutorial_messages` because that's what we defined in app.js.jsx in the previous step.
- "icon" determines the CSS class of the icon. We set it to `fa fa-handshake-o` to use the [handshake-o Font Awesome Icon](http://fontawesome.io/icon/handshake-o/). You can browse the whole set of available icons at [http://fontawesome.io/icons/](http://fontawesome.io/icons/)

If you refresh the page, you should now see your page linked to in the sidebar.

## Add it to git
Commit early, commit often. 
Let's do that now.
```bash
git add -A
git commit -m 'Made basic tutorial messages page'
```

See you in [Part 7](habmc-07.md)!

