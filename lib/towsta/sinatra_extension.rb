helpers do
  def partial page
    haml "partials/_#{page}".to_sym
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
