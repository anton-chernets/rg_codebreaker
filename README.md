```
Task: http://rubygarage.github.io/slides/rspec#/37/1
Complete:
1) Run game:
.../codebreaker/lib/codebreaker$ ruby console.rb

Enter your name
Anton
The game generates secret code of 4 numbers from 1 to 6
Еry guessing the number
Press h for request a hint.
h
System reveals one of the numbers in the secret code: 
*3**
1234
---
Try again
5123
+---
Try again
532
Input is not correct
5321
++--
Try again
5312
++++
Wanna save information about the game? (y/n)
y
Information about the game saved 
Game is over
Wanna play again? (y/n)
n
The system shuts down

2) Run tests:
.../codebreaker$ rspec spec/codebreaker/game_spec.rb --format doc

3) Refactoring: rubygarage.github.io/slides/refactoring-ruby#/
```

# Codebreaker

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/codebreaker`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codebreaker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codebreaker

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/codebreaker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Codebreaker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/codebreaker/blob/master/CODE_OF_CONDUCT.md).
