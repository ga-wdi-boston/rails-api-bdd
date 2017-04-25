[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Behavior-Driven Development of Rails APIs

We'll answer the following questions in this talk.

-   Why should you care about testing?
-   How do you know what to test?
-   What is the purpose of a feature test?
-   What is the purpose of a unit test?

Tests *limit* what we have to debug. For instance, if we have all green, passing
tests, we know that when we deploy to Heroku our code isn't the problem, rather
an issue with Heroku. Passing tests limits the types of debugging you have to
do.

## Prerequisites

-   [ga-wdi-boston/rails-api](https://github.com/ga-wdi-boston/rails-api)
-   [ga-wdi-boston/rails-activerecord-crud](https://github.com/ga-wdi-boston/rails-activerecord-crud)

## Objectives

By the end of this lesson, students should be able to:

-   Develop a Rails API using outside-in, behavior-driven testing.
-   Describe the difference between Behavior and Test Driven Development
    (BDD vs TDD)
-   Make user stories to drive wireframes.
-   Drive behavior specification with user stories.
-   Write automated CRUD request specs with RSpec.
-   Drive routing, model, and controller specs using request specs.
-   Write model unit specs for associations and validations.

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Install dependencies with `bundle install`.
1.  Run `bundle exec rake db:create` and `bundle exec rake db:migrate`.

## User Story Discussion

Before diving into testing, let's revisit wireframes and user stories. We've
used both of these for our first projects.

Why were they important?
What do our user stories do for the scope of our project?
How are they useful when wireframing our webapp's layout and UX?
How do good user stories and wireframes help with app development?

## Behavior Driven vs. Test Driven Development
Tests can be written before or after writing development code. Writing tests
after development is called 'backfilling'.  Test driven development (TDD) is a
specific order of testing and writing code:

1.  Write a test
1.  Run the test (it should fail)
1.  Write code
1.  Run the test (if it fails, go back to step 3)
1.  Refactor
1.  Run the test

It often refers to bottom-up testing, in which unit tests are written first, and
features are tested afterwards using integration tests. TDD is a challenge, and
if you're feeling up for it, try it! Backfilling tests may be a more attainable
goal for your project.

Behavior Driven Development is top-down testing. It can be done either before
or after writing code, so BDD can be done as part of TDD, or as backfilling.
BDD is about writing a feature (a fancy curl request written in Ruby) and having
that initiate an error (a routing error), then writing a unit that shows the
same error (a routing unit test), then writing the code that passes it, then
running the feature, seeing a new error, etc...

## Outside-In Testing

![Test Cycle](http://jakegoulding.com/images/blog/bdd-cycle.png)

### Feature Tests

Feature tests are for catching regressions/bugs. Features break less because
they're higher level. Features test user experience. Feature tests document
workflow within the app. Feature tests tell you what's missing, and drive each
step of the development process.
Feature tests are driven by user stories.

### Unit Tests

Unit tests drive implementation and break more often, but they're smaller in
scale and faster to execute. Unit tests test developer experience. Unit tests
don't break down the problem into smaller pieces, they give you the confidence
that the smallest pieces work as expected. Unit tests document your code base.

Both of these tests provide *documentation* of your code. Writing tests makes
refactoring easy because we can change one thing and see how it affects the
entire system. After each change in the code we run our unit tests to confirm
our expectations.

## Developer Workflow

Use feature tests to drive your unit tests, and your unit tests to drive your
code. You'll want to save and commit your work often during development. We
suggest commiting:

-   After passing unit tests.
-   After passing a feature.
-   After refactoring and passing all tests.

You can push when you're done passing a feature. You should **always run your
tests** before you commit/push your work.

We'll start with a request spec. Request specs perform a similar job to `curl`:
they emulate testing your API from the client's point-of-view.

Failing request specs will drive creating routing specs. Routing specs will
drive creating controller specs. Finally, controller specs will drive creating
model specs. Once we have all these smaller tests (units) passing, the feature
spec (request spec) should pass automatically!

Let the tests tell you what to do next, and you'll never have to think about
your next task. It helps us get in "the zone"!

## GET All Articles

### Demo: Feature Test

#### `GET /articles` Request Spec

**User story:** As a user, I want to see a list of articles.

To check our specs, we run `bundle exec rake test` from the command line.
What output to we get?

```ruby
Failures:
  1) Articles API GET /articles lists all articles
     Failure/Error: get '/articles'

     ActionController::RoutingError:
       No route matches [GET] "/articles"
     # ./spec/requests/articles_spec.rb:29:in `block (3 levels) in <top (required)>'
```

This output tells us exactly what went wrong (or more accurately, what did not
  go as expected), and should be treated as our guide towards working code.

### Code-along: `GET /articles` Routing Spec

Our test told us that no route matches "/articles". So the next step is to write
a test for that route.
What do we expect that route to do?

Let's work on our `GET /articles` routing spec in [spec/routing/articles_spec.rb](spec/routing/articles_spec.rb) together
to ensure that our routes are mapped to the correct controller method.

Now that we have a test, let's create the route!
Remeber, each time a unit test passes, it's time to commit.

### Code-along: `articles#index` Controller Spec

Let's run `bundle exec rake test` again now that our route test passed.

We get a nice new error:
```sh
Failure/Error: get '/articles'

     AbstractController::ActionNotFound:
       The action 'index' could not be found for ArticlesController
```

To wrap up our checks that all articles are correctly returned from our `index`
 method, we'll need a passing test for the controller method itself: [spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb).

Once the test is written, let's write an `index` method on the Article Controller.
Don't forget to commit when your tests pass!

## GET One Article

### Code-along: `GET /articles/:id` Request Spec

**User Story:** As a user, I want to see a specific article.

In [spec/requests/articles_spec.rb](spec/requests/articles_spec.rb), let's
make sure our API is returning a single article correctly. Before we write our
test, let's think about what our app is supposed to DO when it receives a GET
request to this route.

### Code-along: `GET /articles/:id` Routing Spec

How do we make sure our routes are set to receive GET requests for a single
article? How does routing to `articles#show` differ from `articles#index`?

### Lab: `articles#show` Controller Spec

Working off of our `articles#index`, build out the two `GET show` tests in
[spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb) to
pass. Again, remember how `articles#show` differs from `articles#index` and
be sure to be testing against that.

## Completing Specs

### Lab: DELETE

#### Request spec
**User Story:** As a user, I want to be able to delete an article.

Based on our `GET` specs, complete [request](spec/requests/articles_spec.rb).
What does a request to delete do?

#### Routing spec
Based on our `GET` specs, complete [routing](spec/routing/articles_spec.rb) specs for `DELETE`. What should the route do? Then write a route so that the test passes.
Remember to commit after passing the test!

#### Controller spec

Continue working in [spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb) to
create passing tests for the `DELETE` controller actions. What does the `DELETE`
controller action do?
Then write the controller action so that the test passes, and commit.

### Code-along: PATCH Request
**User Story:** As a user, I would like to update an article.

Working together, let's create a feature test for `PATCH` requests.

### Lab: PATCH route
Write a test for the `PATCH` route, and make it pass.

### Code-along: PATCH controller
Now that our route works, we're getting an error about our controller. Let's
write a test for that!

### Lab: POST
**User Story:** As a user, I would like to create an article.

Write a feature test for post requests.
Then, following BDD, write tests for the route and controller.

## Testing Our Model

### Code-along: `Article` Model Spec

**User Story** As a user, I want to see the comments associated with an article.
**User Story** As a user, I want comments to be deleted when an article is deleted.

In [spec/models/articles_spec.rb](spec/models/articles_spec.rb), we will need
to write tests to check for the following:

1.  Articles can have many comments.
1.  If an article is destroyed, its associated comments must also be destroyed.

Our first step will be to create feature tests to account for these
new requirements. Create a new file: `spec/requests/article_comments_spec.rb`.

### Lab: Write `Article` Model and Run the Specs

Based on our `Article` Model specs, run your specs to complete what is expected
 at [app/models/article.rb](app/models/article.rb).

 Run one spec at a time until they have all passed.

### Code-along: Test Article Model

 In [spec/models/article_spec.rb](spec/models/article_spec.rb), let's test to
 see if we:

1.  are associating comments to articles
1.  have set our `inverse_of` record
1.  are deleting comments associated to articles when articles are deleted

### Code-along: Iterate over Article Model to Ensure Validations

Using our BDD skills, let's create tests to check that our Article model is
[validating the presence](http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html#method-i-validates_presence_of)
of `content` and `title`. We don't want articles created that are missing
 either one of those fields.

We will create our tests first and let those drive us towards an
adequately-validated model.

### Lab: Test Comments Resource

Create and run through request, routing, controller and model specs for our
Comments resource.

## Additional Resources

-   [RSpec Rails on Github](https://github.com/rspec/rspec-rails)
-   [How I learned to test my Rails Applications, series](http://everydayrails.com/2012/03/12/testing-series-intro.html)
-   [Better Spec](http://betterspecs.org/)
-   [Rspec Docs from Relish](https://relishapp.com/rspec)
-   [A great example of outside-in testing from Ruby Tapas](http://everydayrails.com/2014/01/15/outside-in-example-ruby-tapas.html)
-   [#275 How I Test - RailsCasts](http://railscasts.com/episodes/275-how-i-test)
-   [How We Test Rails Applications](http://robots.thoughtbot.com/how-we-test-rails-applications)


## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
