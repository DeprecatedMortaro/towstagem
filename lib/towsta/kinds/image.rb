module Towsta
  module Kinds

    class ImageKind < MainKind

      def set content
        begin
          @content = Bresson::ImageReference.new JSON.parse(content[1..-2], :symbolize_names => true)
        rescue
          @content = nil
        end
      end

      def export
        return '' if @content.nil?
        "(#{@content.to_s})"
      end

    end

  end
end
