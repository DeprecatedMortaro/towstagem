module Towsta
  module Kinds

    class DateKind

      attr_accessor :content

      def initialize content
        self.set content
      end

      def get
        @content
      end

      def set content
        return @content = content if content.class == DateTime
        begin
          @content = DateTime.strptime(value, '%m/%d/%Y')
        rescue
          @content = nil
        end
      end

      def compare object
        @content == object
      end

      def export
        @content.strftime('%m/%d/%Y')
      end

    end

  end
end
