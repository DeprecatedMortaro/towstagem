module Towsta
  module Kinds

    class GalleryKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        return @content = content if content.class == Array
        begin
          gal = JSON.parse(value, :symbolize_names => true)
          @content = []
          gal.each {|g| @content << Bresson::ImageReference.new(g)}
        rescue
          @content = []
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
