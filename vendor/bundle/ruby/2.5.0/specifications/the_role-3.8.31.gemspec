# -*- encoding: utf-8 -*-
# stub: the_role 3.8.31 ruby lib

Gem::Specification.new do |s|
  s.name = "the_role".freeze
  s.version = "3.8.31"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ilya N. Zykin [the-teacher]".freeze]
  s.date = "2017-04-07"
  s.description = "Authorization gem for Ruby on Rails with Management Panel".freeze
  s.email = ["zykin-ilya@ya.ru".freeze]
  s.homepage = "https://github.com/the-teacher/the_role".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Authorization for Rails".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<the_role_api>.freeze, ["= 3.8.3"])
      s.add_runtime_dependency(%q<the_role_management_panel>.freeze, ["= 3.8.3"])
    else
      s.add_dependency(%q<the_role_api>.freeze, ["= 3.8.3"])
      s.add_dependency(%q<the_role_management_panel>.freeze, ["= 3.8.3"])
    end
  else
    s.add_dependency(%q<the_role_api>.freeze, ["= 3.8.3"])
    s.add_dependency(%q<the_role_management_panel>.freeze, ["= 3.8.3"])
  end
end
