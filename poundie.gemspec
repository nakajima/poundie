# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{poundie}
  s.version = "0.1.0"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Pat Nakajima}]
  s.date = %q{2011-05-13}
  s.files = [%q{Gemfile}, %q{Gemfile.lock}, %q{README.md}, %q{lib/poundie.rb}, %q{lib/poundie/campfire/message.rb}, %q{lib/poundie/campfire/user.rb}, %q{lib/poundie/plugin.rb}, %q{lib/poundie/plugins/greeter.rb}, %q{lib/poundie/plugins/debug.rb}, %q{lib/poundie/runner.rb}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.0}
  s.summary = %q{A campfire bot}
  s.description = "Uses plugins to interact with campfire rooms"
  s.add_dependency("tinder")
  s.add_dependency("typhoeus")
end
