$LOAD_PATH << File.dirname(__FILE__)

require "tinder"
require "yaml"
require "readline"

require "poundie/runner"
require "poundie/plugin"
require "poundie/campfire/user"
require "poundie/campfire/message"
require "poundie/plugins/greeter"

trap('INT') { puts "ok bye!" ; exit! }

module Poundie
  def self.start(name="default")
    name.gsub!(/\W/, '_')
    runner = Runner.new(name)
    runner.run
  end

  def self.use(plugin)
    puts "Using #{plugin}"
    Poundie::Plugin.active << Poundie::Plugin.list[plugin]
  end
end
