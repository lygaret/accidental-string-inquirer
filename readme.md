---
name:    string-inquirer
version: 0.0.1
summary: |
  a small, simple mixin for string equality predicates
---

Adds methods to string which allows checking for string equality through
arbitrary predicate methods.

Basically what Rails does in ActiveSupport, but packaged as a tiny gem.

## Usage

Add this repo to your `Gemfile`:

```ruby
gem "string-inquirer", "~> 0", git: "https://gist.github.com/117441fc5236de9f7d54b76894d69dec.git"
```

Then in your code:

```ruby
runtime_mode = "development".freeze
runtime_mode = Accidental::StringInquirer.upgrade runtime_mode

"development".development? #=> NoMethodError
runtime_mode.development? #=> true
```
