# -*- encoding: utf-8 -*-
# stub: the_string_to_slug 1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "the_string_to_slug".freeze
  s.version = "1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ilya N. Zykin".freeze]
  s.date = "2016-12-04"
  s.description = " Convert strings and symbols to slug param ".freeze
  s.email = ["zykin-ilya@ya.ru".freeze]
  s.homepage = "https://github.com/the-teacher/the_string_to_slug".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Transliteration + Parameterization for slugs building".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails-i18n>.freeze, ["~> 4.0.0.pre"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails-i18n>.freeze, ["~> 4.0.0.pre"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails-i18n>.freeze, ["~> 4.0.0.pre"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
