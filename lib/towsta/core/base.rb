module Towsta

  class Core

    def initialize args={}
      self.attributes.merge(args).each {|k,v| self.send("#{k}=".to_sym, v)}
      self.class.all << self
    end

    def self.to_hash
      hashes = []
      self.all.each {|hash| hashes << hash.attributes}
      hashes
    end

    def self.add_occurrence occurrence
      self.send(:define_singleton_method, "occurrences_of_#{occurrence[:name].downcase}") do
        eval occurrence[:items].inspect
      end
    end

  end

end
