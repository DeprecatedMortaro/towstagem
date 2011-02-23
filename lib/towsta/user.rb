module Towsta
  class User

    attr_accessor :nick, :email, :id

    class << self
      attr_accessor :tree
      attr_accessor :all
      User.tree ||= Tree.new
      User.all ||= []
    end

    def initialize args
      args.each {|k,v| instance_variable_set("@#{k}", v) unless v.nil? }
      User.tree.add self
      User.all << self
    end

    def self.find id
      User.tree.find id
    end
  end
end
