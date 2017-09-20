Let's make a route to create tutorial messages.
It should map POST requests to the create action of the tutorial messages controller (which we'll write in a moment).
In config/routes.rb, add a line
```ruby
post 'missions/:mission_id/tutorial_messages' => 'tutorial_messages#create'
```

You might be wondering what `missions/:mission_id/tutorial_messages` is all about.
That's how we'll make it get attached to the right mission -- we'll configure it so that POST request to, say `/missions/1/tutorial_messages`, the message gets attached to the mission with the id of 1. 

## Making the controller
Create a new file, app/controllers/tutorial_messages_controller.rb, with the following contents:

```ruby
class TutorialMessagesController < ApplicationController

end
```

Now let's add a private method to it that gets the parameters. 
We only want to accept the content parameter, and we also want 
```ruby
private

def tutorial_message_params
    params.require(:tutorial_message).permit(:contents).tap do |parameters|
      parameters[:mission_id] = params[:mission_id]
    end
end
```

And now let's make the create action.
```ruby
def create
    @tutorial_message = TutorialMessage.new(tutorial_message_params)
    
    if @tutorial_message.save
      render json: @tutorial_message
    else
      render json: @tutorial_message.errors, status: :unprocessable_entity
    end
end
```

Your final controller should look like
```ruby
class TutorialMessagesController < ApplicationController

  def create
    @tutorial_message = TutorialMessage.new(tutorial_message_params)

    if @tutorial_message.save
      render json: @tutorial_message
    else
      render json: @tutorial_message.errors, status: :unprocessable_entity
    end
  end

  private

  def tutorial_message_params
    params.require(:tutorial_message).permit(:contents).tap do |parameters|
      parameters[:mission_id] = params[:mission_id]
    end
  end

end

```

## Add it to git
Let's commit this:
```bash
git add -A
git commit -m 'Wrote tutorial messages controller'
```

Great! On to [Part 6](habmc-06.md)
