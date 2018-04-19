
# PropTypes

Let's make our leadership table have a property that's an array of objects, and call it leaders.
As a small hint, you might want to use `PropTypes.object`.
See if you can write this yourself.

Don't forget to import PropTypes at the top. 

Our solution ended up being:
```jsx harmony
LeadershipTable.propTypes = {
  leaders: PropTypes.arrayOf(PropTypes.object).isRequired
};
```

Note that we could have specified what it was an array of in more depth, so that it was an array of all the props we listed in Leader.
This would have looked something like
```jsx harmony
LeadershipTable.propTypes = {
  leaders: PropTypes.arrayOf(PropTypes.shape({
      name: PropTypes.string.isRequired,
      image: PropTypes.string.isRequired,
      email: PropTypes.string.isRequired,

      // one of the two
      role: PropTypes.string,
      roles: PropTypes.arrayOf(PropTypes.string)
  })).isRequired
};
```
The decision between these two is purely stylistic -- the props will be checked when we create a Leader no matter what.
The disadvantage to fully specifying it is that if the props changed, we'd have to change them in both places.
However, the advantage is that it's significantly easier to see what the properties the LeadershipTable wants.
If you had never seen LeadershipTable before, but wanted to create one, the first place you'd look would be at the PropTypes to see what it was asking for.

A solution that combines the best of both worlds would be
```jsx harmony
LeadershipTable.propTypes = {
  leaders: PropTypes.arrayOf(Leader.propTypes).isRequired
};
```
This lets you avoid repeating yourself, while still being clearer about what properties its asking for.
Now, if you were looking at the proptypes to see what it was asking for, you'd immediately know where next to look, without having to look too deep into the code.

# Make the leadership table use it
Step one in the render function is to divide the leaders into groups of three.
Each group will be a row in the table, and each element will be a leader.
This was our solution.

```jsx harmony
        const columns = 3;
        const rows = [];

        for (let i = 0; i < this.props.leaders.length; i += columns) {
            rows.push(this.props.leaders.slice(i, i+columns));
        }
```

Then, we need to use it.
```jsx harmony
        return (
            <table>
                {
                    rows.map(function (row, i) {
                      return (
                          <tr key={i}>
                              {
                                  row.map(function (leader, j) {
                                      return <Leader key={j} {...leader} />
                                  })
                              }
                          </tr>
                      )
                    })
                }
            </table>
        )
```

It's rarely good practice to have a map within a map, but in this case it's acceptable.
If there was anything more complex than a `<tr>` or if the second map was returning more than just a single element, then we'd want to create a new component (called LeadershipTableRow or something) and extract out the logic.
In this case though, it's so simple that adding an extra Component type would only make it more confusing.

The one bit of unfamiliar syntax is `{...leader}`. 
This is just shorthand for passing in all the properties of `leader`.
The alternative would have been something like:
```jsx harmony
  return <Leader key={j}
                 name={leader.name}
                 image={leader.image}
                 email={leader.email}
                 role={leader.role}
                 roles={leader.roles}
  />
```
but `{...leader}` is much cleaner (and is robust if we change the definition of leader).

Anyway, let's wrap this up in [Part 7](react-on-main-07.md)
 