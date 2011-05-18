# POUNDIE

Poundie is a Campfire bot.

Here's how you use it:

    require "rubygems"
    require "poundie"

    # Specify which plugins to use
    Poundie.use :greeter

    # Start listening
    Poundie.start

Poundie ships with one built-in plugin, called `:greeter`. Here's how a
plugin works:

    # Your plugin needs inherit from Poundie::Plugin
    class Greeter < Poundie::Plugin

      # Next, register your plugin. This will be used to activate it.
      register :greeter

      # This specifies which messages should trigger the plugin's behavior
      match do |message|
        message.body == "greet"
      end

      # This specifies the plugin's behavior
      action do |message|
        speak "Hello, #{message.user.name}"
      end
    end

Pretty easy! The message that gets passed to `match` and `action` is:

    message.body # text of the message
    message.type # TextMessage, PasteMessage, SoundMessage, or TweetMessage
    message.text? # message is text?
    message.paste? # message is paste?
    message.sound? # message is sound?
    message.tweet? # message is tweet?
    message.created_at # when the message was posted
    message.user.name # name of the user who posted the message
    message.user.email # email address of the user
    message.user.admin? # is the user an admin?
    message.user.created_at # when the user was created

What can you do in the `action`?

    speak "Some text"
    tweet "https://twitter.com/steve_martocci/status/69140542038097921"
    paste "Some long text"

That's about it for now.

## Available Plugins

* [poundie-last-tweet](https://github.com/nakajima/poundie-last-tweet) - Posts the last tweet from a given Twitter user to campfire
* [poundie-weather](https://github.com/nakajima/poundie-weather) - Posts weather information for a given city to campfire
* [poundie-wikipedia](https://github.com/nakajima/poundie-wikipedia) - Search wikipedia from campfire
* [poundie-pic](https://github.com/nakajima/poundie-pic) - Post first google image result for a given term to campfire
* [poundie-shake-shack](https://github.com/nakajima/poundie-shake-shack) - Post latest shake shack cam to campfire