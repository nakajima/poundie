module Poundie
  module Plugins
    class Greeter < Poundie::Plugin
      register :greeter

      match do |message|
        message.body == "greet"
      end

      action do |message|
        speak "Hello, #{message.user.name}"
      end
    end
  end
end
