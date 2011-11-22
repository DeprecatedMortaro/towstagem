module Towsta
  module Kinds

    class MoneyKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        @content = content.to_f
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
