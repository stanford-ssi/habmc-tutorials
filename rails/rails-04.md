Dudley has a problem: his site looks like garbage.
Let's change that.

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

Next, we require bootstrap in the actual css.
Rename `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.scss`, which let's us use SASS.
SASS adds a few features like nesting to CSS that make it more readable, and let us include bootstrap by adding at the bottom of our new `app/assets/stylesheets/application.scss`
```sass
@import "bootstrap-sprockets";
@import "bootstrap";
```

