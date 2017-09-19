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

Also, add the class `pull-right` to the button:
```html
<button id="createRandom" class="btn btn-lg btn-primary pull-right">Create Random Transmission</button>
```
 


