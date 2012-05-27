module Towsta

  class Core

    class << self
      attr_accessor :attributes
    end

    def attributes
      horizontal = {}
      self.class.attributes.each do |attr|
        slice = send :"object_of_#{attr.to_s}"
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
      self.class_eval("

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

        def self.find_by_#{attr} value
          self.all.each { |horizontal| return horizontal if horizontal.object_of_#{attr}.compare value }
          nil
        end

        def self.find_by_parameterized_#{attr} value
          self.all.each { |horizontal| return horizontal if horizontal.object_of_#{attr}.compare_parameterized value }
          nil
        end

        def self.find_all_by_#{attr} value
          self.all.select { |horizontal| horizontal.object_of_#{attr}.compare value }
        end

      ")
      self.attributes ||= []
      self.attributes << attr.to_sym
    end

  end

end
