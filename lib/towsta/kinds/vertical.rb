module Towsta
  module Kinds

    class VerticalKind < MainKind

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
        return @content = content if klasses.include? content.class
        @content = content.to_i
      end

      def compare object
        self.get.id.to_i == object.id.to_i if klasses.include? object.class
        self.get.id.to_i == object.to_i
      end

      def export
        self.get.id.to_s
      end

      private

        def klasses
          Vertical.all + [User]
        end

    end

  end
end
