module Towsta
  module Kinds

    class IntegerKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        @content = content.to_i
      end

      def compare object
        @content == object.to_i
      end

      def export
        @content.to_s
      end

    end

  end
end
