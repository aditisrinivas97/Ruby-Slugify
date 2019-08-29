# Ruby-Slugify
URL - friendly slugify in Ruby

## Install

Gemfile :
```ruby
gem 'ruby-slugify', '~> 1.0'
```

Installing the Gem :
```
gem install ruby-slugify
```

## Usage Examples

By default the language is taken as English
```ruby
> newObj = RubySlugify.new("---Hello-World!---")
> slug = newObj.createSlug()
> puts slug
hello-world
```

Specifying other languages can be done using ISO 2 Letter Language Codes. The following are supported :
1. English - en
2. Spanish - es
3. Polish - po
4. Finnish - fi
5. Dutch - nl
6. Greek - gr, el, ell
7. German - de
8. Turkish - tr

```ruby
> newObj = RubySlugify.new("Diese & Dass", "de")
> slug = newObj.createSlug()
> puts slug
diese-und-dass
```

You can also provide a custom map

```ruby
> customMap = {
    "ball" => "bat",
    "ike" => "hello"
  }
> newObj = RubySlugify.new("I like my ball", "en", customMap)
> slug = newObj.createSlug()
> puts slug
i-lhello-my-bat
```

To check if a string is slugified use the isSlug method
```ruby
> RubySlugify.isSlug("sjjdj##d")
false
```

## Licence

This project is released under the [MIT License](https://github.com/aditisrinivas97/ruby-slugify/blob/master/LICENSE).