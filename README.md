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

### Rake Tasks

```ruby
rake db:recreate
```
Drops db, creates db, runs migrations, seeds db. This task will fail if the server is running locally or a `rails console` is connected to the db.

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
              |-- components
              |-- pages
              |-- _base.scss
              |-- application.scss
              |-- email.scss
```

* `/components/..`
  * For reusable, composable elements
* `/pages/..`
  * For page specific code, ie 'home' or 'contact' pages
* `_base.scss`
  * For core variables and bootstrap overrides
* `application.scss`
  * Main manifest file
* `email.scss`
  * For HTML emails


### Javascript

* Reference: [Airbnb Javascript Style Guide](https://github.com/airbnb/javascript/tree/master/es5)
