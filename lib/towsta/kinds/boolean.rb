module Towsta
  module Kinds

    class BooleanKind < MainKind

      def set content
        @content = content == '1'
      end

      def export
        return '1' if @content.class == TrueClass
        '0'
      end

    end

  end
end
