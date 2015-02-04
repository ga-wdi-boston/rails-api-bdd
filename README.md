![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Feature and Unit Testing in Rails Apps with Capybara and RSpec

- How do you know what to test? 
- What is the purpose of a feature test? 
- What is the purpose of a unit test?

Tests *limit* what we have to debug. For instance, if we have all green, passing tests, we know that when we deploy to Heroku our code isn't the problem, rather an issue with Heroku. Passing tests limits the types of debugging you have to do.

### Feature Tests

**Feature tests** are for catching regressions/bugs. Features break less because they're higher level. Features test user experience. Feature tests document workflow within the app. Feature tests tell you what's missing, and drive each step of the development process.

### Unit Tests

**Unit tests** drive implementation and break more often, but they're smaller in scale and faster to execute. Unit tests test developer experience. Unit tests don't break down the problem into smaller, they give you the confidence that the smallest pieces work as expected. Unit tests document your code base.

Both of these tests provide *documentation* of your code. Writing tests makes refactoring easy because we can change one thing and see how it affects the entire system. After each change in the code we run our unit tests to confirm our expectations.

2 times we commit:

1. We commit after passing unit tests.
1. We commit and **push** whenever we pass a feature.
1. After we finish refactoring and all tests are green (passing).

You should always run your tests before you commit/push your work.

## Objectives

By the end of this lesson, students should be able to:

* Write CRUD feature tests using Capybara with RSpec
* Write unit tests drive by features using RSpec
* Write code to pass all of the tests
* Explain when and why to write a unit vs. feature test
* Write generic feature tests
* Deploy an app to Heroku

## Instructions

* Fork, clone.
* Follow along with instructor led example of fully testing a single resource of Articles (model, controllers, migrations, routes)
* When prompted, create another resource (Comments) together using the testing process practiced with the instructor in the prior step
* On your own, create another resources (Votes for articles) using the testing process we've just practiced. This will likely be a non-RESTful resource with different controller actions than you're used to (perhaps a `up` and `down` actions instead of `show` or `index`). Think about what it means to vote something, and how you might test it. 
## Heroku

We use **Heroku**, a cloud hosting platform, as a free and public place to host our Rails projects. From now on, you will be deploying much of your work to Heroku, but first you need to learn how to do it. 

* Follow along with the instructions in the official Heroku documents, [Getting Started with Rails 4.x on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4) to get your fully tested app deployed to Heroku. Take note that it prompts you through creating a new entire application- do **not** do this. We already have an application, but through careful reading of instructions you should be able to figure out where to pick up. 
* 

## Bonus (Optional Section)

If you're looking for extra challenge or practice once you've completed the above, try to...

- Make comments have many comments. Comments can be nested, or `Comment has_many :comments`.
- Implement voting on both comments and articles. Currently, we only implemented voting on articles.
- Implement [Devise](https://github.com/plataformatec/devise) for user authentication. You should only be able to create a new article, comment on an article, or vote if you are logged in.

## Additional Resources

List additional related resources such as videos, blog posts and official documentation.

- [Capybara on Github](https://github.com/jnicklas/capybara)
- [RSpec Rails on Github](https://github.com/jnicklas/capybara)
- [Heroku Error Codes](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=heroku%20error%20codes)
- [How I learned to test my Rails Applications, series](http://everydayrails.com/2012/03/12/testing-series-intro.html)
- [Better Spec](http://betterspecs.org/)
- [Rspec Docs from Relish](https://relishapp.com/rspec)
