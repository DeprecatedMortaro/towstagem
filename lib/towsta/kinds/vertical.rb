module Towsta
  module Kinds

    class VerticalKind < MainKind

      def get
        return nil unless @content
        return @content if @content.class != Fixnum
        Towsta::Core.subclasses.each do |v|
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
        return @content = content if Towsta::Core.subclasses.include? content.class
        @content = content.to_i
      end

      def compare object
        self.get.id.to_i == object.id.to_i if Towsta::Core.subclasses.include? object.class
        self.get == object
      end

      def export
        return @content.id.to_s if Towsta::Core.subclasses.include? self.get.class
        @content.to_s
      end

    end

  end
end
