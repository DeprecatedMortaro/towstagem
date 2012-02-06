module Towsta
  module Kinds

    class MultipleKind < MainKind

      attr_accessor :content

      def get
        return @content if @content.class == Array
        return [] if !!(@content =~ /[^0-9 ]/)
        aux = []
        @content.to_s.split(' ').each do |i|
          Vertical.all.each do |v|
            horizontal = v.find_by_id i.to_i
            aux << horizontal if horizontal
          end
        end
        @content = aux
      end

      def set content
        return @content = content if content.class == Array
        @content = content.to_s
      end

      def export
        get.collect{|c| c.id}.join ' '
      end

    end

  end
end
