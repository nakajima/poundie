module Poundie
  module Campfire
    class User
      def self.get(room, user_id)
        cache[user_id] || begin
          json = room.users.detect { |u| u["id"] == user_id }
          cache[user_id] = Poundie::Campfire::User.new(json)
        end
      end

      def self.cache
        @cache ||= {}
      end

      def initialize(hash)
        @hash = hash
      end

      def id
        @hash[:id]
      end

      def name
        @hash[:name]
      end

      def email_address
        @hash[:email_address]
      end

      def admin?
        @hash[:admin]
      end

      def created_at
        @hash[:admin]
      end

      def type
        @hash[:type]
      end
    end
  end
end
