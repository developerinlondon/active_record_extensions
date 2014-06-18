# ActiveRecordExtensions

Extend the ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'active_record_extensions', github: 'developerinlondon/active_record_extensions'

And then execute:

    $ bundle

## Usage

```ruby
TestModel.update_or_create(attributes_to_match, attributes_to_update)
```
```ruby
TestModel.delete_then_create(attributes_to_match, attributes_to_update)
```

## Run tests
`bundle exec rspec`

## Contributing

1. Fork it ( https://github.com/developerinlondon/active_record_extensions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
