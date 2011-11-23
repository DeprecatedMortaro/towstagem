module Towsta
  class Synchronizer

    attr_accessor :secret, :params, :cache

    def initialize args
      Vertical.all = []
      @secret = args[:secret]
      @params = args[:params]
      @cache = args[:cache]
      if synchronize
        puts "  Ready to Towst!\n\n"
        create_verticals
      else
        puts "  Unable to keep Towsting!\n\n"
      end
    end

    def synchronize
      if has_secret && (cache_string || remote_string)
        return false unless validate_secret
        return false unless validate_response
        return true
      end
      false
    end

    def create_verticals
      return false unless parse_json
      create_vertical({:name => 'User', :slices => {:id => 'integer', :nick => 'text', :email => 'text'}}, @response[:users])
      @response[:structures].each_with_index {|structure, i| create_vertical(structure, @response[:verticals][i][:horizontals], @response[:verticals][i][:occurrences])}
    end

    private

    def remote_string
      begin
        uri = "/synchronizers/#{@secret}/#{Time.now.to_i}/export.json"
        uri += "?query=#{CGI::escape(@params.to_json)}" if @params
        @response = Net::HTTP.start("manager.towsta.com"){|http| @json = http.get(uri).body}
        return true
      rescue
        return false
      end
    end

    def cache_string
      @response = @cache if @cache
      !!@cache
    end

    def validate_secret
      return true if @response != " "
      puts "  maybe your secret is wrong"
      false
    end

    def validate_response
      return true if @response[0] == "{"
      puts "  something wrong with the server"
      false
    end

    def has_secret
      return true if @secret
      puts "\nyou cant synchronize without a secret..."
      false
    end

    def parse_json
      begin
        @response = JSON.parse @response, :symbolize_names => true
        return true
      rescue
        puts '  Something went wrong tryng to parse JSON.'
        return false
      end
    end

    def create_vertical structure, horizontals, occurrences=[]
      #Object.send(:remove_const, :User) if defined? eval(structure[:name].to_s)
      Vertical.create structure
      Vertical.all << eval(structure[:name])
      horizontals.each {|horizontal| eval(structure[:name].to_s).new(horizontal)}
      occurrences.each {|occurrence| eval(structure[:name].to_s).add_occurrence(occurrence)}
      puts "  vertical #{structure[:name]} was created with #{horizontals.size} horizontals"
    end

  end

end
