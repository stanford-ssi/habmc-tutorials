## Validation

We don't want people to be able to create invalid transmissions.
Remember app/models/transmission.rb?
It's time to edit it.

All transmissions should have an altitude, latitude, longitude, and temperature, which we can ensure with the lines
```ruby
validates :altitude, presence: true
validates :latitude, presence: true
validates :longitude, presence: true
validates :temperature, presence: true
```

We can also make sure that they're within reasonable bounds with
```ruby
validates_numericality_of :altitude, greater_than: 0
validates_numericality_of :latitude, greater_than: -90, less_than: 90
validates_numericality_of :longitude, greater_than: -180, less_than: 180
```

But creating transmissions by hand is for chumps anyway. 
Let's make code that creates a random transmission for us.

## Defining a method

Let's start by defining a static method on Transmission (meaning that we'll be able to call `Transmission.create_random` rather than needing a reference to a particular instance).
We can do this with
```ruby
  def self.create_random
    puts 'You created a random transmission (well, not really)'
  end
```

We can test this from the rails console.
Run
```bash
docker-compose run app rails c
```

Then run
```ruby
Transmission.create_random
```
This will print out `You created a random transmission (well, not really)`. 

The rails console is a great tool for debugging -- you'll learn to love it.

## Making it do something
Let's make it create a transmission with completely random data.
Because rails is awesome, this is as simple as:
```ruby
  def self.create_random
    Transmission.create(
        altitude: rand(1..100_000),
        latitude: rand(-90..90),
        longitude: rand(-180..180),
        temperature: rand(-80..40)
    )
  end
```

Isn't ruby cool?
Test it out in the rails console, then visit [http://localhost:3000/transmissions](http://localhost:3000/transmissions) to see the transmission it just created!

## Basing it off the last transmission
Realistically, a balloon wouldn't be jumping between 1 and 100,000 meters every transmission.
Each field only changes a little bit.
Let's make that happen.

First, let's find the last transmission:
```ruby
last_transmission = Transmission.order('created_at').last # praise rails for how easy this is
```

If it doesn't exist, let's return what we had before
```ruby
if last_transmission.blank?
  return Transmission.create(
      altitude: rand(1..100_000),
      latitude: rand(-90..90),
      longitude: rand(-180..180),
      temperature: rand(-80..40)
  )
end
```

Ordinarily though, we'll just add a random number to each of the corresponding fields, making sure they stay in reasonable bounds:
```ruby
new_altitude = last_transmission.altitude + rand(-100..100)
new_altitude = 1 if new_altitude <= 0

new_latitude = (last_transmission.latitude + rand(-1..1)) % 90
new_longitude = (last_transmission.longitude + rand(-1..1)) % 180

new_temperature = last_transmission.temperature + rand(-3..3)

Transmission.create(
    altitude: new_altitude,
    latitude: new_latitude,
    longitude: new_longitude,
    temperature: new_temperature
)
```

Restart the rails console and try it out!
Then go on to [Part 8](rails-08.md)
