# EruditionApp

### Process

We work within the Git Feature Branching Workflow, use Slack for internal communication, and Heroku for hosting.

### Dependencies

* Ruby 2.2.3
* Rails 4.2.3
* PostgreSQL
* Heroku Toolbelt
* Git

If you have questions installing any of these please ask.

### CSS

Reference: [Airbnb CSS/Sass Style Guide](https://github.com/airbnb/css)

#### File Structure

```
|-- eruditionapp
    |-- app
        |-- assets
          |-- images
          |-- javascripts
          |-- stylesheets
              |-- application.scss
              |-- _base.scss
              |-- components
              |-- static
```

* `application.scss`
  * Main manifest file
* `_base.scss`
  * For core variables and bootstrap overrides
* `/components/..`
  * For reusable, composable elements
* `/static/..`
  * For page specific code, ie 'home' or 'contact' pages

### Javascript

* Reference: [Airbnb Javascript Style Guide](https://github.com/airbnb/javascript/tree/master/es5)
