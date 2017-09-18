Alright, it's time for the convoluted plot line again.
Dudley is going launching a high altitude balloon, and it sends data down by dropping chunks of ham.
He needs a ground station, but first, he needs a nice home page.

## Making a new controller and view
`rails g` stands for rails generate, and we can use that to generate a new controller and route.
We need to run the command
```bash
docker-compose run app rails g controller static home
```
- `docker-compose run app` tells it to run the command in the docker instance
- `rails g` tells it to run rails generate
- `controller static home` tells it to create a new `controller` named `static` with one method, `home`

Now we can go to [localhost:3000/static/home](http://localhost:3000/static/home), and we should see the text Static#home.

## Making it be the home page
Let's edit config/routes.rb.
It has one line in the definition:
```ruby
get 'static/home'
```
This tells it that you can make GET requests to the path /static/home. 
It's shorthand for saying `get 'static/home' => 'static#home'`,
which tells it when it goes to the path /static/home to send it to the StaticController and call the `home` method.

But we want to make that the home page.
There's special syntax for that:
```ruby
root 'static#home'
```

Your routes.rb file should now look like:
```ruby
Rails.application.routes.draw do
  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
```

You can now go to [localhost:3000](http://localhost:3000) and see the home page rendered.

## Adding some content
Let's make it display a welcome message and the current date.
We told `routes.rb` to go to the `static` controller, so let's open that on up (it lives in app/controllers/static_controller.rb).
The `home` method is currently empty.
Let's make it find the current date so that it can we displayed.
Include the following line inside the `home` method:
```ruby
@date = DateTime.current
```
This stores the current date in the `@date` variable, which is accessible from the view.

Speaking of the view, let's head on over there.
There is app/views/static/home.html.erb

First, delete everything in home.html.erb. 
We don't want any of it.
Now, let's add a large header with a welcome message:
```html
<h1>Welcome to HAM-MC</h1>
``` 

And below it, put the date:
```html
<p>
  The current time is <%= @date %>
</p>
```

The `<%= %>` syntax allows you to embed ruby code.
That's why the file extension is `html.erb` -- it's html with embedded ruby.
That means you could write something like `Tomorrow is <%= @date + 1.day %>` if you wanted.

If you go to [localhost:3000](http://localhost:3000) now, you'll see the date printed out, but it's ugly.
Let's format it by changing `<%= @date %>` to 
```
<%= @date.to_s :long %>
```

Now, on to [the next step](rails-04.md)
