module Towsta
  module Kinds

    class MoneyKind < MainKind

      def set content
        content = content.gsub('.','').gsub(',','.') if content.class == String
        @content = content.to_f
      end

      def compare object
        @content == object.to_f
      end

      def export
        return '0' if @content == 0
        content = ("%.2f" % @content).split('.')
        "#{content.first.reverse.scan(/.{1,3}/).join('.').reverse},#{content.last}"
      end

    end

  end
end
