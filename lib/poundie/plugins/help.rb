module Poundie
  class Help < Poundie::Plugin
    register :help, "poundie help - gives this message"

    match do |message|
      message.body == "poundie help"
    end

    action do |message|
      help = "Poundie Help\n\n#{Poundie::Plugin.help.join("\n")}"
      paste help
    end
  end
end
