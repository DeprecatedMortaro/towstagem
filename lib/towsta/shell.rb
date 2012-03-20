module Towsta
  class Shell
    def self.sinatra_init *args
      code  = "require 'towsta'\n\n"
      code += "Towsta.secret = ''\n"
      code += "#Towsta.author = 'your@email.com'\n"
      code += "#Towsta.global = {}"
      File.open("configs/towsta.rb", 'w') {|f| f.write(code)}
      #to-do: add gem towsta
      #to-do: require towsta
    end
  end
end
