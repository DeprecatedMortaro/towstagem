module Towsta
  module Kinds

    class GalleryKind < MainKind

      def set content
        return @content = content if content.class == Array
        begin
          gal = JSON.parse(content, :symbolize_names => true)
          @content = []
          gal.each {|g| @content << Bresson::ImageReference.new(g)}
        rescue
          @content = []
        end
      end

      def export
        return '' if @content.class == Array && @content.empty?
        "[#{@content.join ','}]"
      end

    end

  end
end
