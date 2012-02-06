module Towsta
  module Kinds

    class VerticalKind < MainKind

      def get
        return nil unless @content
        return @content if @content.class != Fixnum
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
        return @content = nil if !!(content =~ /[^0-9]/)
        return @content = content if Vertical.all.include? content.class
        @content = content.to_i
      end

      def compare object
        self.get.id.to_i == object.id.to_i if Vertical.all.include? object.class
        self.get == object
      end

      def export
        return @content.id.to_s if Vertical.all.include? self.get.class
        @content.to_s
      end

    end

  end
end
