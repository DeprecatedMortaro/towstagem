module Towsta
  module Kinds

    class ListKind < MainKind

      def set content
        @content = content if content.class == Array
        @content = content.split(', ')
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
