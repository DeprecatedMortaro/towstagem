module Towsta
  module Kinds

    class ListKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

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
