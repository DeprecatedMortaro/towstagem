module Towsta

  class Login

    def self.authenticate params
      response = Towsta::Synchronizer.authentication_request params
      Sinatra::Sessionography.session[:current_user] = response[:id] if response[:status]
      response[:status]
    end

    def self.rescue
      return User.find(session[:current_user]) if defined? User
      Sinatra::Sessionography.session[:current_user]
    end


  end

end
