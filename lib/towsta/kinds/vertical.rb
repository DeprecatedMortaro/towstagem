module Towsta
  module Kinds

    class VerticalKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        return @content if @content.class != String
        Vertical.all.each do |v|
          horizontal = v.find_by_id @content
          if horizontal
            @content = horizontal
            return horizontal
          end
        end
        nil
      end

      def set content
        klasses = Vertical.all + [User]
        return @content = content if klasses.include? content.class
        @content = content.to_i
      end

      def compare object
        @content.id.to_i == object.id.to_i
      end

      def export
        @content.id.to_s
      end

    end

  end
end
