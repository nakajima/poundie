module Poundie
  module Campfire
    class User
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
