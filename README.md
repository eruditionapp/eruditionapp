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

#### File Structure

```
|-- eruditionapp
    |-- app
        |-- assets
          |-- images
          |-- javascripts
          |-- stylesheets
              |-- base
              |-- components
              |-- pages
              |-- application.scss
              |-- email.scss
```

* `/base/..`
  * Fonts, functions, variables, Bootstrap overrides
* `/components/..`
  * Reusable and composable page elements
* `/pages/..`
  * Page specific layouts
* `application.scss`
  * Application manifest file
* `email.scss`
  * Email manifest file

#### z-index
* `.navbar.transparent: 15`
* `.cover .carousel: 1`
* `.cover .container: 10`



### Javascript

* Reference: [Airbnb Javascript Style Guide](https://github.com/airbnb/javascript/tree/master/es5)

#### File Structure

```
|-- eruditionapp
    |-- app
        |-- assets
          |-- images
          |-- javascripts
              |-- modules
              |-- _global.js
              |-- _main.js
              |-- application.js
```

* `/modules/..`
  * Modular pattern for page functions
* `_global.js`
  * Global variables and functions
* `_main.js`
  * Initialize modules
* `application.js`
  * Application manifest file
