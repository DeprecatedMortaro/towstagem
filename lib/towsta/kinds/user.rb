module Towsta
  module Kinds

    class UserKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        return @content if @content.class == User
        user = User.find @content
        @content = user if user
        @content
      end

      def set content
        return @content = content if content.class == User
        @content = content.to_i
      end

      def compare object
        @content.id.to_i == object.id.to_i
      end

      def export
        @content.id.to_s
      end

    end

  end
end
