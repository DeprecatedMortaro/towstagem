module Towsta
  module Kinds

    class DatetimeKind < MainKind

      def set content
        return @content = content if content.class == Time
        begin
          @content = DateTime.strptime(content, '%m/%d/%Y %H:%M').to_time
        rescue
          @content = nil
        end
      end

      def export
        return @content.strftime('%m/%d/%Y %H:%M') if @content.class == Time
        @content.to_s
      end

    end

  end
end
