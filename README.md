# Meetcute.us

<a href="https://assembly.com/meetcute-us/bounties"><img src="https://asm-badger.herokuapp.com/meetcute-us/badges/tasks.svg" height="24px" alt="Open Tasks" /></a>

## Tell your love story

This is a product being built by the Assembly community. You can help push this idea forward by visiting [https://assembly.com/meetcute-us](https://assembly.com/meetcute-us).

### Environment Setup

This is a Rails 4.1 app so you should already be setup with ruby, rubygems, and
postgresql on your machine.

#### Local

First clone this repo:

`> git clone git@github.com:asm-products/meetcute-us.git`

Cd into meetcure-us:

`> cd meetcute-us`

Bundle install all gems:

`> bundle install`

Configure your local postgres database, change `config/database.yml` to match
your local settings

Migrate the databases:

Development:

`> rake db:migrate`

Test:

`> RAILS_ENV=test rake db:migrate`

A good way to see if everything is working is to run the test suite:

`> rake spec`

If all goes well, start the local server, the app uses `guard` to manage
starting/stopping/restarting the server for you:

`> bundle exec guard`

## Contributing

1. Fork it ( https://github.com/asm-products/meetcute-us )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create specs for all additions
4. Make sure all specs pass
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
