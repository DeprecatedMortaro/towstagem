module Towsta
  module Kinds

    class UserKind < MainKind

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
        return self.get.id.to_i == object.id.to_i if object.class == User
        self.get.id.to_i == object.to_i
      end

      def export
        return @content.id.to_s if @content.class == User
        @content.to_s
      end

    end

  end
end
