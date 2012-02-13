module Towsta

  class Vertical

    cattr_accessor :all

    self.all ||= []

    def self.create args
      klass = Class.new(VerticalCore) { args[:slices].each { |attr, kind| define_attribute attr, kind } }
      klass.all = []
      Vertical.all << klass
      Object.const_set args[:name], klass
      puts "  class #{args[:name]} was created"
    end

    def self.populate classname, horizontals, occurrences = []
      klass = Kernel.const_get classname.to_s
      klass.all = []
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
