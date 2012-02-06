module Towsta
  module Kinds

    class BooleanKind < MainKind

      def set content
        return @content = content if [TrueClass, FalseClass].include? content.class
        @content = content.to_i == 1
      end

      def export
        return '1' if @content.class == TrueClass
        '0'
      end

    end

  end
end
