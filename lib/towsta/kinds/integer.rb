module Towsta
  module Kinds

    class IntegerKind < MainKind

      def set content
        @content = content.to_i
      end

      def compare object
        self.get == object.to_i
      end

    end

  end
end
