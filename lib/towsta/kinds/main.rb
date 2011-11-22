module Towsta
  module Kinds

    class MainKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        @content = content.to_s
      end

      def compare object
        @content == object
      end

      def export
        @content
      end

    end

  end
end
