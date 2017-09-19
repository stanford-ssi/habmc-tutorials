
While HAM-MC lacks pretty much all of HABMC's features, hopefully you know have at least some idea of how something like this can be made. 

## Problems with our existing implementation
HAM-MC has a number of problems, which would make it ill-suited for the real world.

1. Server load. Hitting the server once per second is a really bad idea, especially when you have dozens of clients. HABMC solves this via a combination of websockets and Russian doll caching (ask Kai what those are!).
2. Authentication and authorization. We don't want just anybody to be able to see our data; we need a login system.
3. Code maintainability. Using a bunch of listeners and ajax requests all over the place will quickly lead to extremely confusing code. HABMC uses the React/Redux framework for keeping the frontend clean.
4. Rendering efficiency. The current set up is fine for only updating a little text, but for more complex changes to the DOM it will bog down fast. React/Redux helps a lot with this in HABMC.
5. Flexibility. Different missions have different data formats that it needs to know how to parse and store. HABMC solves this via serializing the data prior to storage in the database.

This is just the tip of the iceberg, but if you'd like to learn more about these challenges and how they were solved, please ask me!
My slack username is `@kai`` or you can email me at [kaimarsh@stanford.edu](mailto:kaimarsh@stanford.edu).

## Next steps
Feel free to jump straight onboard HABMC
But if you want to polish your skills, it's a great idea to play around more with Rails.
Rails is a super powerful beast, and you aren't expected to learn it all in one go.
There are a lot of great tutorials out there:
- [https://www.railstutorial.org/book](https://www.railstutorial.org/book))
- [http://railsforzombies.org/](http://railsforzombies.org/)
- [A list of a bunch more](http://www.learnrubyandrails.com/)

But I highly recommend just messing around on your own, trying to build something, and googling a lot.
With that in mind, here are some ideas for how to improve HAM-MC:
- Add a login system using [devise](https://github.com/plataformatec/devise)
- Make HAM-MC support multiple missions (look into [associations](http://guides.rubyonrails.org/association_basics.html))
- Add a graph using [Highstock Charts](https://www.highcharts.com/stock/demo)
- Add a google map
- Make it send data through websockets using [Action Cable](http://guides.rubyonrails.org/action_cable_overview.html)

Creating a fresh rails app to do something completely different, like:
- Set up a blog about sea cucumbers
- Make an online store that sells bulk-rate avocados and avocado accessories
- Design a social network for people who don't like hopscotch

## With apologies to Shakespeare

Get thee to a [HABMC tutorial](../habmc/habmc-01.md), go. Farewell. Or, if thou wilt needs program, program an app, for wise men know well enough what monsters bleens makes of them. To a [HABMC tutorial](../habmc/habmc-01.md), go, and quickly too. Farewell.
