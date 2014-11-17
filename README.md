# TypeHinting

I sometimes find myself writing code like this:

```ruby
  def do_something_with_argument(argument)
    unless argument.kind_of?(SomeClassImExpecting)
      raise Exception, 'Whatever'
    end
    do_more_stuff
  end
```

This gem provides a mixin which add two class methods, return\_type and  
param\_types, that are a bit nicer to work with.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'type_hinting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install type_hinting

## Usage

Dead simple, here's the example used in the tests:

```ruby

class TypeHinted
  include TypeHinting

  def return_should_work
    []
  end
  return_type(:return_should_work, Array)
  # raise if method returns anything other than array

  def return_should_raise
    nil
  end
  return_type(:return_should_raise, Array)
  # same as above

  def hinted_params(a, b = 4)
    [a, b]
  end
  param_types(:hinted_params, Array, Fixnum) 
  # raise if passed anything other than Array for arg1,
  # raise if passed anything other than Fixnum for arg2
  # nil is allowed for arg2 since there is a default param
end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/type_hinting/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
