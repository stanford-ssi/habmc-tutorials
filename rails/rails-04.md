Dudley has a problem: his site looks like garbage.
Let's change that.

**For Ubuntu Users:** Before we change it, however, let's [let you in on a little secret](rails-04-Ubuntu.md).

## Adding bootstrap
Bootstrap is a css library.
CSS stands for Cascading Style Sheets, and is what makes websites pretty; if you wanted to turn a header green, for instance, you could do that with CSS.
Bootstrap is a a package of classy styles.

To install it, open up the Gemfile and add the line anywhere in the middle
```ruby
gem 'bootstrap-sass', '~> 3.3.6'
```

Next, stop whatever server you have running and run
```bash
docker-compose build
```
This rebuilds the container, including installing the new library.
Once it's done, you can restart the servers with
```bash
docker-compose up
```

**For Ubuntu Users:** Is your server closing out? [Try this fix](rails-04-Ubuntu.md#server-is-already-running-error)

Next, we require bootstrap in the actual css.
Rename `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.scss`, which let's us use SASS.
SASS adds a few features like nesting to CSS that make it more readable, and let us include bootstrap by adding at the bottom of our new `app/assets/stylesheets/application.scss`
```sass
@import "bootstrap-sprockets";
@import "bootstrap";
```

We also should include the bootstrap javascript, by adding to `app/assets/javascripts/application.js`
```js
//= require bootstrap-sprockets
```

Stick that below `//= require turbolinks` but above `//= require_tree .`

## Layouts
From page to page, a lot of content like the header and footer will be the same.
That's why we have the file `app/views/layouts/application.html.erb`.
Let's add open it up and have a look.

First, there's the outer html tag, which is required by the html spec.
Then, there's the `<head>` section, which includes information about the page: what its title is and to include various javascripts and stylesheets.
Finally, there's the `<body>` tag, which has some embeded ruby that calls `yield`.

`yield` will return the html from the view (eg the home.html.erb we were working with before), and stick it within that body tag for the browser to render.

## Giving the content some padding
Change the contents of the body tag to look like
```html
<div class="container">
  <div class="jumbotron">
    <%= yield %>
  </div>
</div>
```
This creates a `div` -- a basic html container element, and gives it the class `container`.
The stylesheet then gives anything with the class `container` a style that pushes it out away from the edges of the screen.
Classes in general are the recommended way to give certain elements certain styles.

We have a second div inside the first, with the class of jumbotron, which applies more bootstrap styles.
Inside that, we `yield` to the content of the view.

## Adding a header
Let's also give it a header, for when we add more pages.
Right about the container, put the following code:
```html
<nav class="navbar navbar-default navbar-fixed">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">HAM-MC</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="/">Home</a></li>
      </ul>
    </div>
  </div>
</nav>
```

There are a couple different kinds of elements here.
They're all just different sorts of containers for the content within, and they all can have classes that let styles be applied to them.
Let's look at the types:
- `nav`, which is used for navigation elements. Behaves pretty similarly to a div.
- `div`, which we already know about. It's just a generic container
- `span`, which is like a div except it's inline. In other words, two divs next to each other render on two lines, but two spans next to each other render on the same line.
- `button` is exactly what is sounds like. You can use javascript to make it do something when it's clicked. 
- `a` is a link. If you click on it, it will take you to whatever url its `href` attribute specifies
- `ul` is an unordered list
- `li` is a list item


Our site now looks at least a little cleaner.
On to the [next step](rails-05.md)!
