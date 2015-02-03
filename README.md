![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Feature and Unit Testing in Rails Apps with Capybara and RSpec

How do you know what to test? What is the purpose of a feature test? What is the purpose of a unit test?

Tests limit what we have to debug. For instance, if we have all green, passing tests, we know that when we deploy to Heroku our code isn't the problem, rather an issue with Heroku. Passing tests limits the types of debugging you have to do.

Feature tests are for catching regressions/bugs. Features break less because they're higher level. Features test user experience. Feature tests document workflow within the app. Feature tests tell you what's missing, and drive each step of the development process.

Unit tests drive implementation and break more often, but they're smaller in scale and faster to execute. Unit tests test developer experience. Unit tests don't break down the problem into smaller, they give you the confidence that the smallest pieces work as expected. Unit tests document your code base.

Both of these tests provide documentation of your code. Writing tests makes refactoring easy because we can change one thing and see how it affects the entire system. After each change in the code we run our unit tests to confirm our expectations.

2 times we commit:

1. We commit whenever we complete a feature.
2. After we finish refactoring and all tests are green (passing).

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

## Heroku




## Bonus (Optional Section)

If you're looking for extra challenge or practice once you've completed the above, try to...

## Notes

Gotcha's and extra information

## Additional Resources

List additional related resources such as videos, blog posts and official documentation.

- Item 1
- Item 2
- Item 3


articles spec for articles is the demo (i do)
comments spec will be guided lab (we do)
votes (only for articles) spec (you do)

bonus: nested comments
bonus: voting on both comments and articles
bonus: devise for user authentication