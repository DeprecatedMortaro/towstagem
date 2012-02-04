module Towsta

  class VerticalCore

    class << self
      attr_accessor :attributes
    end

    def attributes
      horizontal = {}
      self.class.attributes.each do |attr|
        slice = eval("self.object_of_#{attr.to_s}")
        horizontal[attr] = slice ? slice.export : nil
      end
      horizontal
    end

    def meta_attributes
      a = attributes.clone
      a.delete :author
      a.delete :created_at
      a.delete :updated_at
      a.delete :id
      a
    end

    def self.define_attribute attr, kind
      self.class_eval "

        def #{attr}= value
          @#{attr} ||= Towsta::Kinds::#{kind[0].upcase + kind[1..-1]}Kind.new
          @#{attr}.set value
        end

        def #{attr}
          @#{attr}.get
        end

        def object_of_#{attr}
          @#{attr}
        end

      "
    end

  end

end
