module Poundie
  class Runner
    CONFIG_FILE = File.join(ENV["HOME"], ".poundie_")

    def initialize(name)
      @name = name
      configure
    end

    def run
      room.join # We need to make sure we're in the room first
      Yajl::HttpStream.get(room_uri, :symbolize_keys => true) do |message|
        Thread.new do
          plugins.each { |plugin| plugin.call(message) }
        end
      end
      puts "Connection lost. Reconnecting..."
      sleep 3
      run
    end

    private

    def plugins
      @plugins ||= Poundie::Plugin.active.map do |plugin|
        plugin.new(room)
      end
    end

    def room_uri
      URI.parse("http://#{@token}:x@streaming.campfirenow.com//room/#{room.id}/live.json")
    end

    def room
      @room ||= campfire.rooms.detect { |r| r.name == @room_name }
    end

    def campfire
      @campfire ||= Tinder::Campfire.new(@subdomain, :token => @token)
    end

    def configure
      if File.exists?(CONFIG_FILE + @name)
        @subdomain, @token, @room_name = YAML.load_file(CONFIG_FILE + @name)
      else
        puts "Configuring..."
        @subdomain = ask("Enter Campfire Subdomain: ")
        @token     = ask("Enter Campfire Token: ")
        @room_name = ask("Enter Campfire Room Name: ")
        File.open(CONFIG_FILE + @name, "w+") { |file|
          YAML.dump([@subdomain, @token, @room_name], file)
        }
      end
    end

    def ask(msg)
      Readline.readline(msg)
    end
  end
end
