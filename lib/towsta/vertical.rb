module Towsta

  class Vertical

    def self.create args
      model_file = Towsta.models_path + args[:name].underscore + '.rb'
      File.open(model_file, 'w') {|f| f.write("class #{args[:name]} < Towsta::Core\nend")} unless File.exists? model_file
      require model_file
      klass = Object.const_get args[:name]
      args[:slices].each { |attr, kind| klass.define_attribute attr, kind }
      klass.all = []
    end

    def self.populate classname, horizontals, count, occurrences = []
      klass = Kernel.const_get classname.to_s
      klass.all = []
      klass.count = count
      horizontals.each {|horizontal| klass.new(horizontal)}
      occurrences.each {|occurrence| klass.add_occurrence(occurrence)}
      puts "  class #{classname} was populated with #{horizontals.size} instances"
    end

    def self.clear
      Vertical.all.each {|vertical| Object.instance_eval{ remove_const vertical.to_s.to_sym }}
      Vertical.all = []
    end

  end

end
