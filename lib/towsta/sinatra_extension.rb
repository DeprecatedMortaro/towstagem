helpers do
  def partial page
    haml "partials/_#{page}".to_sym
  end
end
