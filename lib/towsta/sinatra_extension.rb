enable :sessions

helpers do

  def partial page
    haml "partials/_#{page}".to_sym
  end

  def authenticate args
    response = Towsta::Synchronizer.authentication_request args
    session[:current_user] = response[:id] if response[:status]
    response[:status]
  end

  def current_user
    return User.find(session[:current_user]) if defined? User
    session[:current_user]
  end

  def forget
    session[:current_user] = nil
  end

end

post '/flush' do
  clear_sync
  'CLEAR'
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end
