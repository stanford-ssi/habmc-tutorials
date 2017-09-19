Let's make a button the user can click to call `Transmission.create_random`.

## Controller
We can start with the controller action.
In app/controllers/transmissions_controller, let's make a new action called `create_random`.
It should render the transmission that was just created.
This is dead simple to make:
```ruby
def create_random
  render json: Transmission.create_random
end
```

This will call the method we wrote in the previous step, and render it as json as a response.

## Route
We need to be able to call this action, by making some kind of HTTP request to some url.
Let's make all POST requests to `/transmissions/create_random` call the method.
In config/routes.rb, add:
```ruby
post 'transmissions/create_random' => 'transmissions#create_random'
```

## The button
Now that we have a request to make, we need a button to make it.
Let's add a button to the home page in app/views/static/home.html.erb
```html
<button id="createRandom" class="btn btn-primary">Create Random Transmission</button>
```

## Adding jQuery
JQuery is a javascript library that makes interacting with elements a lot easier.
Install it by adding 

And by adding to app/assets/javascripts/application.js, right under `//= require turbolinks`
```js
//= require jquery
//= require jquery_ujs
```

## Making a request on click
We need to wait for the document to load.
At that point, we need to listen for a click, then do something.
Let's create a new file, app/assets/javascripts/create_random.js with the contents:

```js
$(document).on('turbolinks:load', function () {
    $('#createRandom').on('click', function () {
        alert('Clicked!');
    });
});
```

`$( ... )` selects some element -- either the document, or the element by its css selector.
`$('#createRandom')`, for instance, selects the element with id `createRandom`, which just so happens to be the button we created earlier.

`.on(event, callback)` listens for events of the provided type -- like load or click -- and when it occurs, fires off the given function. 

Of course, rather than just making an alert, let's have it make a request.
Inside that click function:
```js
$.ajax({
    method: 'POST',
    url: '/transmissions/create_random'
})
```

You can verify this works by clicking it and looking at the transmission index page.

## Giving a little feedback
We want to know if it was successful more easily.
Let's add an element to home.html.erb that we can update with javascript
```html
<p id="feedback"></p>
```

Now we can make two javascript functions in create_random.js: `setFeedback` and `resetFeedback`
```js
function setFeedback(text) {
    $('#feedback')
        .hide()
        .text(text)
        .slideDown();
}

function resetFeedback() {
    $('#feedback').slideUp();
}
```

And we can hook those up to the AJAX call -- the thing that makes the request. 
```js
$.ajax({
    method: 'POST',
    url: '/transmissions/create_random',
    success: function () {
        setFeedback('Success');
        setTimeout(resetFeedback, 3000);
    },
    error: function () {
        setFeedback('Failure');
        setTimeout(resetFeedback, 3000);
    }
})
```

The only new thing here is the `setTimeout` function, which calls the provided callback after the provided number of milliseconds.

On to [Part 9](rails-09.md)!

