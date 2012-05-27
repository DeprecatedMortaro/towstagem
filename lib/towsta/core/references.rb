module Towsta

  class Core

    class << self
      attr_accessor :all, :count
    end

    self.all = []

    def self.first
      self.all.first
    end

    def self.last
      self.all.last
    end

    def self.find id
      self.find_by_id id
    end

    def self.random
      position = (self.all.size) - 1
      self.all[rand(position)]
    end

  end

end
