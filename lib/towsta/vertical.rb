module Towsta

  class Vertical

    class << self
      attr_accessor :all
    end

    def self.create args
      klass = Class.new(VerticalCore) { args[:slices].each { |attr, kind| define_attribute attr, kind } }
      klass.all = []
      klass.attributes = args[:slices].keys
      Object.const_set args[:name], klass
    end

  end

end
