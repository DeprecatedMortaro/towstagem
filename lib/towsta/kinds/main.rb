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
        self.get == object
      end

      def export
        @content.to_s
      end

      def kind
        self.class.to_s.split('::').last.gsub('Kind','').downcase
      end

    end

  end
end
