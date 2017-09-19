## Displaying the last transmission

Let's make the home page display something useful, instead of the time it was loaded at.
Replace the paragraph with a big-ol wall of bootstrap-y structure:

```html
<div class="row transmission">
  <div class="col-md-3">
    <div class="panel panel-default">
      <div class="panel-heading">
        Altitude
      </div>
      <div id="altitude" class="panel-body">
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="panel">
      <div class="panel-heading">
        Latitude
      </div>
      <div id="latitude" class="panel-body">
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="panel">
      <div class="panel-heading">
        Longitude
      </div>
      <div id="longitude" class="panel-body">
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="panel">
      <div class="panel-heading">
        Temperature
      </div>
      <div id="temperature" class="panel-body">
      </div>
    </div>
  </div>
</div>
```

There's nothing new here -- just a bunch of divs with classes that take advantage of bootstrap styles.
We'll start making it update via javascript as soon as we make it just a little prettier.

Create a file `app/assets/stylesheets/transmission.scss`
```sass
.transmission {
  text-align: center;
  .panel-heading {
    border-bottom: 1px solid #DDDDDD;
  }

  .panel-body {
    font-size: 3em;
  }
}
```

Also, wrap the button and feedback in a div with the class `text-center` to center it
```html
<div class="text-center">
  <button id="createRandom" class="btn btn-lg btn-primary">Create Random Transmission</button>
  <p id="feedback"></p>
</div>
```

## Last transmission route
Let's make it so that when a GET request is made to `/transmissions/last`, it goes to a new action on the TransmissionsController which renders the last transmission as JSON. 
Before scrolling down, see if you can write this on your own.
You'll know it's working if you can go to [http://localhost:3000/transmissions/last](http://localhost:3000/transmissions/last) and see the data of the last transmission displayed.
 
.

.

.

.

.

.

.

.

.

.

.

.
 
Had a stab at it?
Okay.

You should have produced something like
```ruby
get 'transmissions/last'
```
or 
```ruby
get 'transmissions/last' => 'transmissions#last'
```
in config/routes.rb

In app/controllers/transmissions_controller.rb, you should have something like
```ruby
def last
  render json: Transmission.order('created_at').last
end
```

## Hit it!
Now, let's make the frontend pull that data in.
First, let's create a function that makes a request to the route we just made.
After it completes a request, it should wait a second, then make another.

Create a file, app/assets/javascripts/refresh.js, and put the following in it:

```js
function refreshTransmissions() {
    $.ajax({
        method: 'GET',
        url: '/transmissions/last.json',
        success: function (transmission) {
            setTimeout(refreshTransmissions, 1000);
        },
        error: function () {
            alert('Error pulling latest transmission')
        }
    })
}
```

Let's make this start running on page load, too:
```js
$(document).on('turbolinks:load', refreshTransmissions);
```

And finally, let's make it update the DOM (DOM is the Document Object Model -- a fancy word for the set of HTML elements we have displayed).
Let's do that with a new function:

```js
function updateFromTransmission(transmission) {
    $('#altitude').text(transmission.altitude + 'm');
    $('#latitude').text(transmission.latitude);
    $('#longitude').text(transmission.longitude);
    $('#temperature').text(transmission.temperature + '°C');
}
```

Then call it from `refreshTransmissions`
Your final `refresh.js` should look like:

```js

function updateFromTransmission(transmission) {
    $('#altitude').text(transmission.altitude + 'm');
    $('#latitude').text(transmission.latitude);
    $('#longitude').text(transmission.longitude);
    $('#temperature').text(transmission.temperature + '°C');
}

function refreshTransmissions() {
    $.ajax({
        method: 'GET',
        url: '/transmissions/last.json',
        success: function (transmission) {
            updateFromTransmission(transmission);

            setTimeout(refreshTransmissions, 1000);
        },
        error: function () {
            alert('Error pulling latest transmission')
        }
    })
}

$(document).on('turbolinks:load', refreshTransmissions);
```

## What now?

Congratulations, you're done with the rails tutorial, and we even forgot to have a convoluted plotline. 
Oh well. 
I recommend playing around with [http://localhost:3000/](http://localhost:3000/) if you haven't already -- try generating transmissions in another tab and see them appear in the original one.

You can either continue on the the [rails bonus section](rails-bonus.md), or just head straight on to the [HABMC tutorial](../habmc/habmc-01.md)
