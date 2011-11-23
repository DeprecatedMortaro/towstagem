module Towsta

  class Login

    def self.authenticate params
      response = Towsta::Synchronizer.authentication_request params
      session[:current_user] = response[:id] if response[:status]
      response[:status]
    end

    def self.rescue
      return User.find(session[:current_user]) if defined? User
      session[:current_user]
    end


  end

end
