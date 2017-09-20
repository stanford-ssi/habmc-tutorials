Let's make a new folder, app/assets/javascripts/components/habmc/pages/tutorial_messages, and move tutorial_messages_page.js.jsx into it.
It's fine to have a page file on its own, but as soon as we start making it more complex than one component, we should be doing it in a folder. 
And guess what -- we're making a couple new components.

## Tutorial Message Input
Let's create a new component, TutorialMessageInput in app/assets/javascripts/components/habmc/pages/tutorial_messages/tutorial_messages_input.js.jsx
As a skeleton, let's make it look like
```jsx harmony
class TutorialMessagesInput extends React.PureComponent {
       
}

TutorialMessagesInput.propTypes = {
    
};
```

We're specifying that it takes no props, and that it's a PureComponent.
A PureComponent means that it will update whenever its properties or state changes.
This makes things efficient, and we should use this wherever possible.
We don't use it for the page, because the page gets passed in a bunch of properties by the app.

Let's make a simple render function that just returns an input
```jsx harmony
    render(){
        return (
            <input className="form-control" />
        )
    }
```

## Making it do something
We want to submit the thing when enter is pressed.
Let's make it call the onKeyUp function -- which we'll write in a moment -- when a key is pressed.
```jsx harmony
<input className="form-control" onKeyUp={this.onKeyUp} />
```

Now we can write `onKeyUp`
```jsx harmony
onKeyUp(e){
    // if it's not enter, ignore it
    if (e.keyCode != 13) {
        return;
    }

    this.submit();
}
```
We'll write the submit function in the next step.

We also need to make sure `this` in `onKeyUp` refers to the right thing.
We can do that by "binding" the function to `this`.
Let's do that in a constructor:
```jsx harmony
constructor(props) {
    super(props);

    this.onKeyUp = this.this.onKeyUp.bind(this);
}
```

## Getting the mission
Let's pause a moment.
Our submit function needs to know the current mission, which means we need to pass that down the chain of elements.

We should record that in the prop types of the page:
```jsx harmony
TutorialMessagesPage.propTypes = {
    mission: React.PropTypes.instanceOf(Immutable.Map).isRequired
};
```

And in the prop types of the input
```jsx harmony
TutorialMessagesInput.propTypes = {
    mission: React.PropTypes.instanceOf(Immutable.Map).isRequired
};
```

We also need to make the page update when the mission changes, so in the page change `shouldComponentUpdate` to look like
```jsx harmony
    shouldComponentUpdate(nextProps, nextState){
        return this.props.mission != nextProps.mission;
    }
```

And finally, we need make the page render the input with the mission passed in
Let's change the page's render function to return
```jsx harmony
<div className="panel panel-default">
    <div className="panel-body">
        <TutorialMessagesInput mission={this.props.mission} />
    </div>
</div>
```

## Making it submit
We need to get a reference to the input element, which we can get by changing the render function to return
```jsx harmony
<input className="form-control" ref="input" onKeyUp={this.onKeyUp} />
```

We finally have all we need to write the submit function:
```jsx harmony
    submit() {
        // get a reference to the element
        let el = $(this.refs.input);

        $.ajax({

            // base the url off the mission id
            url: '/missions/' + this.props.mission.get('id') + '/tutorial_messages',

            // make a POST request
            method: 'POST',

            // make sure the backend doesn't think this is a cross-site scripting attack
            beforeSend: fixCSRF,

            // data that gets sent and can be read with params on the backend
            data: {
                tutorial_message: {
                    contents: el.val() // the content
                }
            },

            // on success or error, notify the user using Sweet Alerts
            success: function () {
                swal({title: 'Message sent!', type: 'success'})
            },
            error: function () {
                swal({title: 'Invalid message', type: 'error'})
            }
        });

        // reset the input
        el.val('');
    }
```

Test it out! 
If it doesn't work, have a look at the javascript console and see if there are any errors.
[Here's what my version looks like](https://github.com/KMarshland/habmc/blob/2d3db1d5e986ed7d6b1eb2c68ba06dbcb0509f0b/app/assets/javascripts/components/habmc/pages/tutorial_messages/tutorial_messages_input.js.jsx)

## Git ahead
```bash
git add -A
git commit -m 'Wrote tutorial messages input'
```

On to [Part 8](habmc-08.md)
