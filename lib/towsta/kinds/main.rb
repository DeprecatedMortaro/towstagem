module Towsta
  module Kinds

    class MainKind

      attr_accessor :content

      def initialize content=nil
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
        @content.to_s
      end

    end

  end
end
