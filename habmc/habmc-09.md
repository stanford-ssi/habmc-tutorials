We have two problems:
1. The data doesn't update in real time
2. The TutorialMessages never get sent

Let's change that.

## Writing a send method
Open app/models/tutorial_message.rb on up again.
Let's make a new method, called `send_to_balloon`.
1. Update its status to sending.
2. Make a HTTP post request to https://httpbin.org/post with the body being the message contents.
3. Update status based on response code -- 200 is success, everything else is a failure 

As you can see, the implementation isn't too bad
```ruby
  def send_to_balloon
    return unless status == 'unsent'
    
    update(status: 'sending')

    response_code = HTTP.post('https://httpbin.org/post', body: contents).code

    unless response_code == 200
      update(status: 'failure')
      return
    end

    update(status: 'success')
  end
```

## Calling the send method
Because rails is awesome, this is also easy to do.
Just add a callback in the method
```ruby
after_commit :send_to_balloon, on: :create
```

## Sending a websocket message on change
Let's make a function like the ones we saw for transmissions, way back when. 
It should look like
```ruby
  def notify_frontend
    $redis.publish('transmissions', JSON(event: 'tutorial_message', mission: mission_id, info: as_json))
  end
```

And we can call it with
```ruby
after_commit :notify_frontend, on: :create
after_commit :notify_frontend, on: :update
```

Our tutorial_message.rb should look like [this](https://github.com/KMarshland/habmc/blob/tutorial-kai-marshland/app/models/tutorial_message.rb)

## Listening on the frontend
It's no use to send messages on through websockets if we aren't listening for them.
We need to edit app/assets/javascripts/habmc_common/api_interface.js.jsx.

In `processMessage`, in the variable `actions`, we should add another function.
When messages of type `tutorial_message` come in, we should dispatch the info to the store.
```jsx harmony
tutorial_message: function () {
    self.store.dispatch({
        type: 'PUT_TUTORIAL_MESSAGE',
        tutorial_message: data.info
    });
}
```

## Play around
You heard the heading.
Play around!

```bash
git add -A
git commit -m 'Made tutorial messages update properly'
```

When you're done, go on to [Part 10](habmc-10.md)
