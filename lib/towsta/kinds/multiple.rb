module Towsta
  module Kinds

    class MultipleKind < MainKind

      attr_accessor :content

      def initialize content=nil
        self.set content
      end

      def get
        return @content if @content.class == Array
        aux = []
        @content.to_s.split(' ').each do |i|
          Vertical.all.each do |v|
            horizontal = v.find_by_id i
            aux << horizontal if horizontal
          end
        end
        @content = aux
        @content
      end

      def set content
        return @content = content if content.class == Array
        @content = content.to_s
      end

      def export
        return @content.to_s if @content.class != Array
        aux = ''
        @content.each {|c| aux << c.id}
        aux
      end

    end

  end
end
