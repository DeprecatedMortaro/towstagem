module Towsta
  class Shell
    def self.sinatra_init *args
      towsta_rb 'configs'
      add_gem
      system 'bundle install'
    end

    def self.towsta_rb folder
      code  = "require 'towsta'\n\n"
      code += "Towsta.secret = ''\n"
      code += "#Towsta.author = 'your@email.com'\n"
      code += "#Towsta.global = {}"
      File.open("#{folder}/towsta.rb", 'w') {|f| f.write(code)}
    end

    def self.add_gem
      gemfile = File.read("Gemfile") << "\ngem 'towsta'"
      File.open("Gemfile", 'w') {|f| f.write(gemfile)}
    end
  end
end
