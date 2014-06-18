# ActiveRecordExtensions

Extend the ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'active_record_extensions', github: 'developerinlondon/active_record_extensions'

And then execute:

    $ bundle

## Usage

### update_or_create
```ruby
TestModel.update_or_create(attributes_to_match, attributes_to_update)
```
Given 3 users:
```ruby
User.create(name: 'John', street: 'Stepney Street', country: 'UK')
User.create(name: 'Jess', street: 'Stepney Street', country: 'UK')
User.create(name: 'Jane', street: 'Well st', country: 'UK')
```
If you want to update the country of first 2 users you can do:
```ruby
User.update_or_create({ street: 'Stepney Street' }, { country: 'Scotland'})
```
Although if you provide `attributes_to_match` that does not match any users then a new user will be created with `attributes_to_match` and `attributes_to_update` attributes.


### delete_then_create
```ruby
TestModel.delete_then_create(attributes_to_match, attributes_to_update)
```
Given 3 users:
```ruby
User.create(name: 'John', street: 'Stepney Street', country: 'UK')
User.create(name: 'Jess', street: 'Stepney Street', country: 'UK')
User.create(name: 'Jane', street: 'Well st', country: 'UK')
```
If you want to destroy first 2 users and then create a user with new attributes you can do:
```ruby
User.delete_then_create({ street: 'Stepney Street' }, { country: 'Scotland'})
```
Although if you provide `attributes_to_match` that does not match any users then a new user will be created with `attributes_to_match` and `attributes_to_update` attributes.

## Run tests
`bundle exec rspec`

## Contributing

1. Fork it ( https://github.com/developerinlondon/active_record_extensions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
