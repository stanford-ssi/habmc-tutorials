We also wanted to be able to fetch data.
Let's add a new route:
```ruby
get 'missions/:mission_id/tutorial_messages' => 'tutorial_messages#index'
```
Try explaining to yourself what this route definition does.

## index action
Let's make a new action in the tutorial messages controller, called index.
It needs to find all tutorial messages with the provided mission id, then render them as json.
See if you can write this yourself.

.

.

.

Hint 1: you can get the mission id with `params[:mission_id]`

.

.

.

Hint 2: You can get the right set of tutorial messages with `render json: TutorialMessage.where(mission_id: params[:mission_id])`

.

.

.

Your function should look like
```ruby
  def index
    render json: TutorialMessage.where(mission_id: params[:mission_id])
  end
```

## Permissions
We only want students to be able to send messages or read old ones.
Let's add a line at the top of the controller that says
```ruby
before_action :requires_student
```

This makes sure the user trying to do any of the actions is a student.

## Loading in messages from the frontend
Open up app/javascript/habmc/interfaces/session_layer/habmc_data_interface.js.jsx and add a line in `initialize`
```jsx harmony
HABMCDataInterface.refreshTutorialMessages();
```

We also need to write that function it's calling.

```jsx harmony
static refreshTutorialMessages(){
    const self = this;

    $.ajax({
        url: '/missions/' + self.store.getState().mission.get('id') + '/tutorial_messages.json',
        success: function (messages) {
            self.store.dispatch({
                type: 'PUT_TUTORIAL_MESSAGE',
                tutorial_messages: messages
            });
        }
    })
}
```

Oh, and remember reducers?
We need to create one in app/javascript/habmc/reducers/tutorial_messages_reducer.js.jsx
```jsx harmony
function TutorialMessagesReducer(state, action) {
    return modelReducer('tutorial_message')(state, action);
}
```

And add it to app/javascript/habmc/store.js.jsx
```jsx harmony
tutorialMessages: TutorialMessagesReducer,
```

## I am the table
Here's something really cool.
We now have access to that data in the page.
Let's first add it as a prop type.
```jsx harmony
TutorialMessagesPage.propTypes = {
    mission: React.PropTypes.instanceOf(Immutable.Map).isRequired,
    tutorialMessages: React.PropTypes.instanceOf(Immutable.OrderedMap).isRequired
};
```

And make the page update when the messages change
```jsx harmony
    shouldComponentUpdate(nextProps, nextState){
        return (this.props.mission != nextProps.mission) ||
            (this.props.tutorialMessages != nextProps.tutorialMessages);
    }
```

Finally, let's render them in a table.
```jsx harmony
    render(){
        return (
            <div className="panel panel-default">
                <div className="panel-body">
                    <Table data={this.props.tutorialMessages} />
                    <TutorialMessagesInput mission={this.props.mission} />
                </div>
            </div>
        )
    }
```

Is that cool or what?
Our data is there.

## Git
There's a lot of stuff that went on here.
If you're not sure you wrote the code correctly, feel free to slack @kai. 

```bash
git add -A
git commit -m 'Made it display old tutorial messages'
```

Next up, [Part 9](habmc-09.md)
