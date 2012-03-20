module Towsta
  class Shell
    def self.sinatra_init *args
      towsta_rb 'configs'
      add_gem
      change_index
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

    def self.change_index
      file = "views/index.haml"
      index = File.read file
      if index.lines.first =~ /Frankstein sinatra is singing /
        index << ' to #{User.first.nick}'
        File.open(file, 'w') {|f| f.write(index)}
      end
    end
  end
end
