module Poundie
  module Campfire
    class Message
      def initialize(room, hash)
        @room, @hash = room, hash
      end

      def id
        @hash[:id]
      end

      def body
        @hash[:body]
      end

      def room_id
        @hash[:room_id]
      end

      def created_at
        @hash[:created_at]
      end

      def user
        Poundie::Campfire::User.get(@room, @hash[:user_id])
      end

      def type
        @hash[:type]
      end

      def text?
        type == "TextMessage"
      end

      def paste?
        type == "PasteMessage"
      end

      def sound?
        type == "SoundMessage"
      end

      def tweet?
        type == "TweetMessage"
      end

      def timestamp?
        type == "TimestampMessage"
      end

      def advertisement?
        type == "AdvertisementMessage"
      end

      def idle?
        type == "IdleMessage"
      end

      def kick?
        type == "KickMessage"
      end

      def leave?
        type == "LeaveMessage"
      end

      def system?
        type == "SystemMessage"
      end

      def topic_change?
        type == "TopicChangeMessage"
      end

      def unidle?
        type == "UnidleMessage"
      end

      def unlock?
        type == "UnlockMessage"
      end

      def upload?
        type == "UploadMessage"
      end
    end
  end
end
