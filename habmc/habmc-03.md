
This is the last section before we can actually start writing code, I promise.
With luck, in addition to being boring this section also gives you the knowledge of where code lives that makes writing new features easy.

HABMC's backend is a pretty standard Rails app (although it does also contain the code for the main SSI website and the internal site to save on server costs), but the data flow to the front end can be confusing.
Let's walk through what happens when a new transmission comes in.

## A POST request is made to /receive-data
This request is made by RockBlock, the satellite communications provider.

[config/routes.rb](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/config/routes.rb#L158)
routes this request to the receive action on the transmissions controller.

## TransmissionsController processes the request
The [Transmissions Controller](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/controllers/transmissions_controller.rb#L46-L58)
extracts the parameters from the transmission, finds the appropriate mission, and creates the Transmission.

## Transmission
On creation, the Transmission calls a number of callbacks, such as error notification and posting its details to Slack.
More importantly, [one of those callbacks publishes a notification of its existence](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/models/transmission.rb#L54). 

## Websocket middleware
The [websocket middleware](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/middleware/lazy_update.rb#L62-L76)
is subscribed to the notifications Transmission creates, and rebroadcasts those messages out to any websocket connections.

## Frontend websocket
The frontend automatically [makes a websocket connection](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/assets/javascripts/habmc_common/api_interface.js.jsx#L51-L92).
This websocket automatically reopens on failures.

## Processing the message
On a message, [processMessage](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/assets/javascripts/habmc_common/api_interface.js.jsx#L98-L213) is called.
While different messages can have different behaviours, [the code for a new transmission](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/assets/javascripts/habmc_common/api_interface.js.jsx#L111-L128)
```jsx harmony
self.store.dispatch({
    type: 'PUT_TRANSMISSION',
    // ...
});
```

## The Redux store
[The store](https://github.com/KMarshland/habmc/blob/master/app/assets/javascripts/components/habmc/store.js.jsx#L4) is a global repository of data for the frontend.
When a new message comes in, it processes it with the appropriate reducer.

## Transmissions Reducer
[The transmissions reducer](https://github.com/KMarshland/habmc/blob/master/app/assets/javascripts/habmc_common/reducers/transmissions_reducer.js.jsx)
is based off a generic [model reducer](https://github.com/KMarshland/habmc/blob/master/app/assets/javascripts/habmc_common/reducers/model_reducer.js.jsx) 
It takes new transmissions that come in and store them in an immutable data structure.
This means that you can check if the transmission have change with a simple `newTransmissions == oldTransmissions`, rather than having to check that `newTransmissions[0] == oldTransmissions[0] && newTransmissions[1] == oldTransmissions[2] && ...`, which means the update cycle can be much more efficient.
These transmissions are stored in the global store.

## Sending the data out
The store [passes all of its information](https://github.com/KMarshland/habmc/blob/5a58fb4ae36ba43eb80d681d7c8ed8d265b4dae6/app/assets/javascripts/components/habmc/store.js.jsx#L46-L48) in to the [app](https://github.com/KMarshland/habmc/blob/master/app/assets/javascripts/components/habmc/app.js.jsx) as properties.
This lets it do things like
```jsx harmony
<div>
{this.props.transmissions.last().get('altitude')}
</div>
```

The app delegates the data to all the pages where it renders and updates the frontend.

ooh-wee, that was long

![Oowee](oowee.gif)

Let's get on to some coding in [Part 4](habmc-04.md)

