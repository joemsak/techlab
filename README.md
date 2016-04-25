# Techlab

Ruby version: `2.3.0` (rbenv, rvm, chruby enabled)

Setup (seeds db with Audio Addict API channels):
```
bundle install
rake db:setup
```

Run tests:
```
rake
```

Notes:

* Dalli cache is enabled in production only
