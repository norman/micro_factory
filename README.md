# MicroFactory

MicroFactory is a a tiny factory library for writing tests with Active Record.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'micro_factory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install micro_factory

## Usage

MicroFactory adds a `factory` method to the class or module you add it to.

The method accepts a class, string or symbol reprenting a class, and a hash of valid attributes for the class.

It then generates three methods you can use to build or create Active Record model instances, and access a hash of valid attributes.

The simplest way to use MicroFactory is by extending it into `ActiveSupport::TestCase`, this makes the factories you create available throughout your test suite.

```ruby
class ActiveSupport::TestCase
  extend FlexMinder::Factories
  factory :State, name: 'Washington', code: 'WA'
end

class StateTest
  test 'it should validate the state code' do
    state = build_state code: 'XX'
    assert_false state.valid?
  end
end
```

In the given example, MicroFactory would generate the following methods:

* `build_state(attributes = {})` - Make a new state instance, optionally with the given attributes merged into the defaults.
* `create_state(attributes={})` - The same as `build_state` but saves it.
* `valid_state_attributes` - Get the default attributes used by the factory methods.

If you don't like the idea of extending ActiveRecord::TestCase, you can put it in your own module to keep it isolated:

```ruby
module MyFactories
  extend MicroFactory
  extend self
end

MyFactories.factory :State, name: 'Washington', code: 'WA'
oregon = MyFactories.build_state code: 'OR', name: 'Oregon'
```

## License

Copyright (c) 2015 Norman Clarke and FlexMinder

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
