module Towsta
  module Kinds

    class ImageKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        begin
          @content = Bresson::ImageReference.new JSON.parse(content[1..-2], :symbolize_names => true)
        rescue
          @content = nil
        end
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
