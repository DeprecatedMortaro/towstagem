module Towsta
  module Kinds

    class DateKind < MainKind

      def set content
        return @content = content if content.class == DateTime
        begin
          @content = DateTime.strptime(value, '%m/%d/%Y')
        rescue
          @content = nil
        end
      end

      def export
        @content.strftime('%m/%d/%Y')
      end

    end

  end
end
