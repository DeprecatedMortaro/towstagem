require 'net/http'
require 'json'

module Towsta
  class Synchronizer

    attr_accessor :secret, :path, :json

    def initialize args
      @secret = args[:secret]
      @path = "#{args[:path]}.json"
      synchronize ? backup : find_old
      puts just_do_it ? 'Ready to Towst!' : 'Unable to keep Towsting!'
    end

    def synchronize
      unless @secret
        puts 'you cant synchronize without a secret...'
        return false
      end
      begin
        Net::HTTP.start("manager.towsta.com"){|http| @json = http.get("/synchronizers/#{@secret}/export.json").body}
        puts 'Synchronized with towsta...'
        if @json == " "
          puts 'Maybe your secret is wrong...'
          return false
        elsif @json[0] != "{"
          puts "something wrong with the server"
          return false
        else
          return true
        end
      rescue
        puts 'failed to synchronize with towsta...'
        return false
      end
    end

    def backup
      if @path
        open(@path, "wb"){|file| file.write @json}
        puts "creating a backup in #{@path}"
      end
    end

    def find_old
      unless File.exists? @path
        puts 'could not find any old version...'
      else
        @json = IO.read(@path).to_s
        puts 'assuming newest backup...'
      end
    end

    def just_do_it
      return false if @hash == " "
      begin
        hash = JSON.parse @json, :symbolize_names => true
      rescue
        puts 'Something went wrong tryng to parse JSON.'
        return false
      end
      Vertical.create :name => 'User', :slices => {:id => 'integer', :nick => 'string', :email => 'string'}
      hash[:users].each {|user| User.new user}
      hash[:structures].each_with_index do |structure, i|
        Vertical.create structure
        Vertical.all << eval(structure[:name])
        hash[:verticals][i][:horizontals].each {|horizontal| Vertical.all.last.new horizontal}
        puts "vertical #{structure[:name]} was created with #{hash[:verticals][i][:horizontals].size} horizontals"
      end
      true
    end    

    def self.callback json
      json = JSON.parse json
      if json[:action] == 'create'
        eval(json[:vertical]).new json[:attributes]
      elsif json[:action] == 'update'
        eval(json[:vertical]).update json[:attributes]
      else
        eval(json[:vertical]).destroy json[:attributes][:id]
      end
    end

  end

end

