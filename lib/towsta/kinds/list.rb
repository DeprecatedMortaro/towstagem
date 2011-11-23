module Towsta
  module Kinds

    class ListKind < MainKind

      def set content
        return @content = content.join(', ').split(', ') if content.class == Array
        @content = content.to_s.split(', ')
      end

      def compare object
        return @content.include? object if object.class == String
        @content == object
      end

      def export
        @content.join(', ')
      end

    end

  end
end
