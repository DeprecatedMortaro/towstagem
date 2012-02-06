module Towsta
  module Kinds

    class UserKind < MainKind

      def get
        return nil unless @content
        return @content if @content.class == User
        @content = User.find_by_id @content
      end

      def set content
        return @content = content if content.class == User
        return @content = nil if !!(content =~ /[^0-9]/)
        return @content = content.to_i
      end

      def compare object
        return self.get.id.to_i == object.id.to_i if object.class == User
        self.get.id.to_i == object.to_i
      end

      def export
        return get.id.to_s if get.class == User
        get.to_s
      end

    end

  end
end
