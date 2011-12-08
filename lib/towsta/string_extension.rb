class String
  def parameterize
    self.gsub(' ', '-').downcase.delete('^a-zA-Z0-9\-')
  end
end
