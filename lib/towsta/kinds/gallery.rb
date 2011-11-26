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
        string = '['
        @content.each {|con| string << "#{con.to_s},"}
        "#{string[0..-2]}]"
      end

    end

  end
end
