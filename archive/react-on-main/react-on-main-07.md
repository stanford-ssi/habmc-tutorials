
We're almost at the end of the road.
All we want now is a nice way to pass in the data to the leadership table.
We want this to be done from the view (aka `leadership.html.erb`) so that we don't have to transfer all the data in the javascript file.
In other words, since we only need the leadership data in one place, there's no sense in defining it outside that place.

We want to be able to have something like this

```html
<script>
renderLeadershipTable(document.getElementById('leadership-react-root'), [
            {
                name: 'Kai Marshland',
                image: imageBase + 'kaiMarshland.jpg',
                role: 'Co-President',
                email: 'kaimarsh@stanford.edu'
            },
            {
                name: 'Shi Tuck',
                image: imageBase + 'shiTuck.jpg',
                role: ['Co-President', 'Satellites Team Lead'],
                email: 'tucks@stanford.edu'
            },
            {
                name: 'Gabi Palavecino',
                image: imageBase + 'gabiPalavecino.jpg',
                role: 'Chief Financial Officer',
                email: 'glps@stanford.edu'
            }
            // more...
]);
</script>
```

# Writing renderLeadershipTable
Let's start by writing that function.
We can rewrite what we have in `app/javascript/packs/main.js.jsx`.

```jsx harmony
function renderLeadershipTable(rootElement, leaders) {
        ReactDOM.render(
            <LeadershipTable leaders={leaders} />,
            rootElement
        )
}
```

But we also need to make it callable globally (because the view has no good way to import it).
All we have to do there is say
```js
window.renderLeadershipTable = renderLeadershipTable;
```
And it will be accessible globally.

Test it to make sure everything works, and I'll see you in the [closing remarks](react-on-main-08.md)
