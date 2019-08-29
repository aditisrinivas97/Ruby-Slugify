Gem::Specification.new do |s|
    s.name = %q{ruby-slugify}
    s.version = "1.0.0"
    s.authors = ["Aditi Srinivas"]
    s.email = ["aditisrinivas97@gmail.com"]
    s.date = %q{2019-08-28}
    s.summary = %q{URL-friendly slugify in Ruby}
    s.files = [
      "lib/ruby-slugify.rb",
      "lib/language-support.rb"
    ]
    s.require_paths = ["lib"]
    s.add_dependency 'stringex'
  end