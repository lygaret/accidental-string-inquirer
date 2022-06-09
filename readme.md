Adds methods to string which allows checking for string equality through
arbitrary predicate methods.

Basically what Rails does in ActiveSupport, but properly handling `respond_to_missing`,
and instantiate as a mixin to a string's `singleton_class`, rather than as a subclass.

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