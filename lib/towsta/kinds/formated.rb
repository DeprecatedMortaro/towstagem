module Towsta
  module Kinds

    class FormatedKind < MainKind

      def set content
        @content = content.to_s.gsub("\'","'")
      end

    end

  end
end
