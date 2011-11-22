module Towsta
  module Kinds

    class DatetimeKind < MainKind

      def set content
        return @content = content if content.class == Time
        begin
          @content = DateTime.strptime(value, '%m/%d/%Y %H:%M').to_time
        rescue
          @content = nil
        end
      end

      def export
        @content.strftime('%m/%d/%Y %H:%M')
      end

    end

  end
end
