require 'date'
require 'time'

module Towsta

  class Vertical

    class << self
      attr_accessor :all
      Vertical.all = []
    end

    def self.create(args)
      klass = Class.new do

        class << self
          attr_accessor :all, :tree, :attributes
        end

        args[:slices].each do |attr, kind|
          eval "def #{attr}= value; #{Vertical.parse_set attr, kind}; end;"
          eval "def #{attr}; #{Vertical.parse_get attr, kind}; end;"
          eval "def self.find_by_#{attr} value; self.all.each {|e| return e if e.#{attr} == value}; nil; end;"
          eval "def self.find_all_by_#{attr} value; found = []; self.all.each {|e| found << e if e.#{attr} == value}; found; end;"
        end

        def self.count
          self.all.size
        end

        def self.first
          self.all.first
        end

        def self.last
          self.all.last
        end

        def self.find id
          self.tree ? self.tree.find(id) : nil
        end

        def initialize args
          args.each {|k,v| eval "self.#{k}= '#{v}';"}
          self.class.tree ? self.class.tree.add(self) : self.class.tree=(Tree.new(self))
          self.class.all << self
        end

        def update args
          args.each {|k,v| eval "self.#{k}= '#{v}';"}
        end

        def self.update args
          self.find(args[:id]).update(args)
        end

        def destroy
          self.class.all.delete self
          self.class.tree.delete self
          self
        end

        def self.destroy id
          element = self.find id
          self.all.delete element
          self.tree.delete element
          element
        end

        def save creator=$towsta_default_author
          export = self.attributes
          export.delete :author
          export.delete :vertical
          id_aux = export.delete(:id)
          export = {:creator => creator, :vertical => self.class.to_s, :attributes => export, :id => id_aux}
          uri = URI.parse("http://manager.towsta.com/synchronizers/#{$towsta_secret}/insert.json")
          JSON.parse Net::HTTP.post_form(uri, {:code => export.to_json}).body.to_s, :symbolize_names => true
        end

        def self.create args
          self.new(args).save
        end

        def attributes
          horizontal = {:vertical => self.class.to_s}
          self.class.attributes.each {|attr| horizontal[attr] = eval(attr.to_s).to_s}
          horizontal
        end

        def find_horizontal id
          Vertical.all.each do |v|
            horizontal = v.find_by_id id.to_i
            return horizontal if horizontal
          end
          nil
        end

      end
      klass.all = []
      klass.attributes = args[:slices].keys
      Object.const_set args[:name], klass
    end

    private
      def self.parse_get attr, kind
        return "@#{attr}.class == String ? self.find_horizontal(@#{attr}) : @#{attr}" if kind == 'vertical'
        "@#{attr}"
      end

      def self.parse_set attr, kind
        return "@#{attr} = value;" if ['main','text','formated','password','link'].include? kind
        return "@#{attr} = value.to_f;" if kind == 'money'
        return "@#{attr} = value.to_i;" if kind == 'integer'
        return "@#{attr} = value == '1';" if kind == 'boolean'
        return "@#{attr} = Date.strptime(value, '%m/%d/%Y');" if kind == 'date'
        return "@#{attr} = DateTime.strptime(value, '%m/%d/%Y %H:%M').to_time;" if kind == 'datetime'
        return "@#{attr} = User.find value.to_i;" if kind == 'user'
        "@#{attr} = value;"
      end
  end

end
