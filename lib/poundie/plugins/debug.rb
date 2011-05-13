module Poundie
  module Plugins
    class Debug < Poundie::Plugin
      register :debug

      match do |message|
        true
      end

      action do |message|
        puts message.inspect
      end
    end
  end
end
