# Techlab

Ruby version: `2.3.0` (rbenv, rvm, chruby enabled)

Setup:
```
bundle install
rake db:setup
```
(the DB is seeded with Audio Addict API channels)

Run tests:
```
rake

-or-

rspec
```

Notes:

* Dalli cache is enabled in production only

To test caching (local memcached server must be running):
```
RAILS_ENV=production rake db:setup
RAILS_ENV=production rake db:setup
```
(the second time will be much faster)
