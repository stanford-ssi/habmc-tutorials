## So just what is this whole HABMC thing anyway?
If you want a list of features, you can check out the [State of the HABMC, Summer 2017](https://goo.gl/q9am3J).
But given that you're here, I'm assuming you want a technical explanation of what's really going on.

What follows is a list of systems involved in HABMC.
They're just here to orient you; 95% of the time you'll just be working on the main app server.

## Main app server (name: habmc)
This is the home you'll grow to love, and where HABMC actually runs.
Think of it like a startup founder: it's in charge of orchestrating everything, does the vast majority of the work, and only occasionally has a nervous breakdown. 

## Primary database (name: postgres)
This is a Postgres database that, well, stores our data.
It's that crotchety old lady who spends her time doing spreadsheets and the day she retires the whole company will fall apart. 

## Caching server (name: redis)
Databases are slow because they often have to read from disk. 
Redis is a dedicated cache that holds data in memory.
It's an order of magnitude faster to fetch data from, compared to postgres -- but can't hold very much, like some hyperactive goldfish with amnesia. 

## Analytics (names: newrelic and google-analytics)
NewRelic helps monitor performance and errors within HABMC;
Google Analytics tracks how many people view HABMC and stats on them.
They're the homeless guy who lives in your attic who makes comments about your choice of friends and fashion sense. 

## Prediction & Navigation (names: prediction and prediction-preprocessor)
I'm going to link to the repository, cause I'm tired of writing: [https://github.com/KMarshland/hab-predictor](https://github.com/KMarshland/hab-predictor).
Wait, the whole point of this section is to explain things?
Fine.
The prediction-preprocessor server downloads weather data from NOAA and turns it into a vaguely readable format. 
The main prediction server is then able to take that preprocessed data and use it to make intelligent predictions about where the balloon will go next.
It's also where navigation lives: analysis of wind patterns to steer ValBal by adjusting altitude into different wind layers.

## CDN (name: cloudflare)
The Content Distribution Network, or CDN takes static assets, like javascripts, stylesheets, and images, and caches them in servers around the world.
This means that when someone views HABMC, they can get most of the resources from Cloudflare's server in San Francisco, rather than having to go all the way to Oregon. 
It's like carrying a backpack filled with a couple key supplies so that you don't have to go very far to get your lunch.

## Radio clients (names: nasonov-client and nasonov-camera)
Something's gotta read the data from antennas and send it on to HABMC.
That's precisely what the Nasonov programs do; [Nasonov-camera](https://github.com/stanford-ssi/nasanov-camera) reads from the camera of whatever computer its on with ffmpeg, sending it to Youtube Live and from there to HABMC; and Nasonov-client reads over serial and sends data via websocket to nasanov-writer.

## Radio backend (names: nasonov-writer, nasonov-reader, and influxdb)
The data from nasonov-client goes somewhere, and that where is nasanov-writer, a server written in Node.
It stores the data in influxdb, and sends it out to nasonov-reader.
Nasonov-reader sends it on to HABMC.
You can see the code at [https://github.com/KMarshland/nasanov-server](https://github.com/KMarshland/nasanov-server).

I guess these are estranged but oddly obsessed mailmen or something? I'm running out of convoluted metaphors. 

On to [Part 3](habmc-03.md), which is even drier! 
