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
-   Make wireframes to drive user stories.
-   Drive behavior specification with user stories.
-   Write automated CRUD request specs with RSpec.
-   Drive routing, model, and controller specs using request specs.

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Install dependencies with `bundle install`.
1.  Run `rake db:create` and `rake db:migrate`.

## Outside-In Testing

![Test Cycle](http://jakegoulding.com/images/blog/bdd-cycle.png)

### Feature Tests

Feature tests are for catching regressions/bugs. Features break less because
they're higher level. Features test user experience. Feature tests document
workflow within the app. Feature tests tell you what's missing, and drive each
step of the development process.

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

### Demo: `GET /articles` Request Spec

To check our specs, we run `rspec spec` from the command line.
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

Let's work on our `GET /articles` routing spec in [spec/routing/articles_spec.rb](spec/routing/articles_spec.rb) together
to ensure that our routes are mapped to the correct controller method.

### Code-along: `articles#index` Controller Spec

To wrap up our checks that all articles are correctly returned from our `index`
 method, we'll need a passing test for the controller method itself: [spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb).

## GET One Article

### Code-along: `GET /articles/:id` Request Spec

In [spec/requests/articles_spec.rb](spec/requests/articles_spec.rb), let's
make sure our API is returning a single article correctly.

### Code-along: `GET /articles/:id` Routing Spec

How do we make sure our routes are set to receive GET requests for a single
article? How does routing to `articles#show` differ from `articles#index`?

### Lab: `articles#show` Controller Spec

Working off of our `articles#index`, build out the two `GET show` tests in
[spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb) to
pass. Again, remember how `articles#show` differs from `articles#index` and
be sure to be testing against that.

## Completing Controller Specs

### Lab: Write `ArticlesController`

Continue working in [spec/controllers/articles_spec.rb](spec/controllers/articles_spec.rb) to
create passing tests for the `POST`, `PATCH`, and `DELETE` controller actions.

## Testing Our Model

### Code-along: `Article` Model Spec

In [spec/models/articles_spec.rb](spec/models/articles_spec.rb), we will need
to test to make sure that new Articles created are new instances of the
`Article` model.

### Lab: Write `Article` Model and Run the Specs

Let's get the test for our `Article` Model working.

## Further Learning

Build out the Controller, Model, and Routes for a `Comment` entity that
belongs to `Article`. Let request, routing, controller and model tests
drive your build.

*Note: a `comments` migration has already been created. The rest is up to you.*

### Bonus Challenge

If you're looking for extra challenge or practice once you've completed the
above, create a voting feature for articles using outside-in testing.

This will likely be a modification of a resource (rather than creating a new
resource) with different controller actions than you're used to (perhaps a
`up` and `down` actions instead of `show` or `index`). Think about what it
means to vote something, and how you might test it. Start by sketching out
page flow on paper. Try to outline your work at a high level before you
start testing and coding.

## Additional Resources

-   [RSpec Rails on Github](https://github.com/rspec/rspec-rails)
-   [How I learned to test my Rails Applications, series](http://everydayrails.com/2012/03/12/testing-series-intro.html)
-   [Better Spec](http://betterspecs.org/)
-   [Rspec Docs from Relish](https://relishapp.com/rspec)
-   [A great example of outside-in testing from Ruby Tapas](http://everydayrails.com/2014/01/15/outside-in-example-ruby-tapas.html)
-   [#275 How I Test - RailsCasts](http://railscasts.com/episodes/275-how-i-test)
-   [How We Test Rails Applications](http://robots.thoughtbot.com/how-we-test-rails-applications)

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
