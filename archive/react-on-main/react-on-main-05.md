
Wow, we know just about enough to implement the leadership page.

# Making the Leader component useful
Back in the day, our code for an individual leader looked something like this:
```html
  <td>
    <div class="uk-border-circle leader-picture">
      <a class="uk-border-circle" href="[[url]]">
        <img src="[[image]]" alt="[[name]]" />
        <div class="overlay">
          <div style="margin-top:[[marginTop]]; text-align:center;">
            <p class="leader-name">[[name]]</p>
            <p class="leader-role">[[role]]</p>
            <p class="leader-email">[[email]]</p>
          </div>
        </div>
      </a>
    </div>
  </td>
```

Lets adapt that. 
There are only a couple things we need to do:
- Create string properties for `name`, `image`, `role`, and `email`, and a number property for `marginTop`.
- Replace `[[url]]` with `javascript:void(0)`. We never pass in a url so this just says "do nothing on click"
- Replace the word `class` with `className`. That's just because `class` is a reserved keyword in javascript, so we and react have to call it something different
- Make everything in brackets refer to the appropriate property.

This should give you something like this:
```jsx harmony
import React from 'react'
import PropTypes from 'prop-types'

export default class Leader extends React.PureComponent {

    render() {
        return (
            <td>
                <div className="uk-border-circle leader-picture">
                    <a className="uk-border-circle" href="javascript:void(0);">
                        <img src={this.props.image} alt={this.props.name} />
                        <div className="overlay">
                            <div style={{
                                textAlign: 'center',
                                marginTop: this.props.marginTop
                            }}>
                                <p className="leader-name">{this.props.name}</p>
                                <p className="leader-role">{this.props.role}</p>
                                <p className="leader-email">{this.props.email}</p>
                            </div>
                        </div>
                    </a>
                </div>
            </td>
        )
    }

}

Leader.propTypes = {
    name: PropTypes.string.isRequired,
    image: PropTypes.string.isRequired,
    role: PropTypes.string.isRequired,
    email: PropTypes.string.isRequired,
    marginTop: PropTypes.number.isRequired
};
```

# Make it a little bit more dynamic
Leader should know how to do a couple more things:
- Add imageBase onto the image url
- Accept multiple roles
- Calculate the marginTop based on the number of roles

See if you can do this yourself, but it's okay if you're not sure how.
That's because we haven't yet introduced a couple useful things:
- Doing computation in the render function
- How to render arrays

Our solution looked like this:
```jsx harmony
import React from 'react'
import PropTypes from 'prop-types'

export default class Leader extends React.PureComponent {

    render() {
        const imageBase = 'https://s3-us-west-1.amazonaws.com/habmc/assets/leadership_pictures/';
        const imageUrl = imageBase + this.props.image;

        let roles = [];

        if (this.props.roles) {
            roles = this.props.roles;
        } else if (this.props.role) {
            roles.push(this.props.role);
        }

        const marginTop = 180 - roles.length * 20;

        return (
            <td>
                <div className="uk-border-circle leader-picture">
                    <a className="uk-border-circle" href="javascript:void(0);">
                        <img src={imageUrl} alt={this.props.name} />
                        <div className="overlay">
                            <div style={{
                                textAlign: 'center',
                                marginTop: marginTop
                            }}>
                                <p className="leader-name">{this.props.name}</p>
                                {
                                    roles.map(function (role, i) {
                                        return <p key={i} className="leader-role">{role}</p>
                                    })
                                }
                                <p className="leader-email">{this.props.email}</p>
                            </div>
                        </div>
                    </a>
                </div>
            </td>
        )
    }

}

Leader.propTypes = {
    name: PropTypes.string.isRequired,
    image: PropTypes.string.isRequired,
    email: PropTypes.string.isRequired,

    // one of the two
    role: PropTypes.string,
    roles: PropTypes.arrayOf(PropTypes.string)
};
```

The thing worth remarking on is `roles.map`.
`map` is a function you can call on any array in javascript, and we have it return `<p>` elements.
They also, mysteriously, have this property called `key` set.
Whenever you are trying to render an array of elements, they have to have this key property set to something unique (in this case, just the index within the array).
This is how React knows which one is which.

Continue on to [the next step](react-on-main-06.md) to make the LeadershipTable component accept an array.
