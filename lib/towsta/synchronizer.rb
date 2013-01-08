module Towsta
  class Synchronizer

    attr_accessor :params, :cache, :response, :status

    def initialize args={}
      @params = solve_params args[:params]
      @cache = args[:cache]
      if synchronize
        args[:request] ||= :horizontals
        create_verticals if [:all, :structure].include? args[:request]
        populate_verticals if [:all, :horizontals].include? args[:request]
        puts "  Ready to Towst!\n\n"
        @status = true
      else
        puts "  Unable to keep Towsting!\n\n"
        @status = false
      end
    end

    def self.save_request export
      begin
        return Rails.cache.fetch export.to_s do
          uri = URI.parse("http://manager.towsta.com/synchronizers/#{Towsta.secret}/import.json")
          JSON.parse Net::HTTP.post_form(uri, {code: export.to_json}).body.to_s, symbolize_names: true
        end
      rescue
        return {status: false, message: 'Internal Server Error'}
      end
    end

    def self.authentication_request params
      begin
        uri = URI.parse("http://manager.towsta.com/authenticate")
        return JSON.parse Net::HTTP.post_form(uri, params).body.to_s, symbolize_names: true
      rescue
        return {status: false}
      end
    end

    private

    def synchronize
      has_secret && (cache_string || remote_string) && validate_secret && validate_response && parse_json
    end

    def solve_params(params)
      return params unless Towsta.global
      Towsta.global.merge (params || {})
    end

    def create_verticals
      Vertical.create name: 'User', slices: {id: 'integer', nick: 'text', email: 'text'}
      @hash[:structures].each {|structure| Vertical.create structure}
    end

    def populate_verticals
      Vertical.populate 'User', @hash[:users], @hash[:users].size
      @hash[:structures].each_with_index {|structure, i| Vertical.populate(structure[:name], @hash[:verticals][i][:horizontals], structure[:count], @hash[:verticals][i][:occurrences])}
    end

    def remote_string
      begin
        uri = "/synchronizers/#{Towsta.secret}/#{Time.now.to_i}/export.json"
        uri += "?query=#{CGI::escape(@params.to_json)}" if @params
        @response = Net::HTTP.start("manager.towsta.com"){|http| @json = http.get(uri).body}
        puts "\nSynchronized with Towsta!"
        return true
      rescue
        puts "\nFailed to synchronize with Towsta."
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
      return true if Towsta.secret
      puts "\nyou cant synchronize without a secret..."
      false
    end

    def parse_json
      begin
        @hash = JSON.parse @response, symbolize_names: true
        return true
      rescue
        puts '  Something went wrong tryng to parse JSON.'
        return false
      end
    end

  end

end
