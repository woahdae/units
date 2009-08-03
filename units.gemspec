# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{units}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lucas Carlson"]
  s.date = %q{2009-08-03}
  s.description = %q{A simple way to add units and conversion ability to numbers in Ruby}
  s.email = %q{lucas@rufy.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/units.rb",
     "lib/units/base.rb",
     "lib/units/currency.rb",
     "lib/units/standard.rb",
     "test/test_helper.rb",
     "test/units/base_test.rb",
     "test/units/currency_test.rb",
     "test/units/standard_test.rb",
     "units.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://rubyforge.org/projects/units}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{units/conversions Gem}
  s.test_files = [
    "test/test_helper.rb",
     "test/units/base_test.rb",
     "test/units/currency_test.rb",
     "test/units/standard_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
