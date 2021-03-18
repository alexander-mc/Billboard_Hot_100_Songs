require_relative 'lib/billboard_hot_100_songs/version'

Gem::Specification.new do |spec|
  spec.name          = "billboard_hot_100_songs"
  spec.version       = BillboardHot100Songs::VERSION
  spec.date          = '2020-09-07'
  spec.authors       = ["Alexander M. Clamor"]
  spec.email         = ["alexander.clamor@gmail.com"]

  spec.summary       = %q{Access data on the Billboard Hot 100 from the command line}
  spec.description   = %q{Quickly generate the list of this week's hottest songs and more!}
  spec.homepage      = "https://github.com/alexander-mc/billboard_hot_100_songs"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new("~> 2.6.1")

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"

  spec.add_dependency "colorize", ">= 0"
  spec.add_dependency "nokogiri", ">= 0"
end
