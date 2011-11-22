module Towsta
  module Kinds

    class BooleanKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        @content = content == '1'
      end

      def compare object
        @content == object
      end

      def export
        return '1' if @content.class == TrueClass
        '0'
      end

    end

  end
end
