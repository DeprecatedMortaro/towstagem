module Towsta
  class MetaBase
    def self.new_class(class_name, attrs)
      klass = Class.new do
        class << self
          attr_accessor :tree
        end
        self.tree = MetaTree.new

        def self.find id
          self.tree.find id
        end

        def self.create_tree
          self.all.each{|a| tree.add a}
        end
      end
      init = ''
      attrs.each {|attr, kind| init << parse_attr(attr, kind)}
      klass.class_eval %{
      attrs.each {|attr, kind| attr_accessor attr};
      def initialize(#{attrs.map {|attr, kind| attr}.join(",")});
        #{init};
        self.class.all << self;
      end;
      }
      Object.const_set class_name, klass
    end

    private
    def self.parse_attr attr, kind
      return "@#{attr} = #{attr};" if ['main','text','formated','password','link'].include? kind
      return "@#{attr} = #{attr}.to_f;" if kind == 'money'
      return "@#{attr} = #{attr}.to_i;" if kind == 'integer'
      return "@#{attr} = #{attr} == 'true';" if kind == 'boolean'
      return "@#{attr} = Date.strptime(#{attr}, '%m/%d/%Y');" if kind == 'date'
      return "@#{attr} = DateTime.strptime(#{attr}, '%m/%d/%Y %H:%M').to_time;" if kind == 'datetime'
      "@#{attr} = #{attr};"
    end
  end
end
