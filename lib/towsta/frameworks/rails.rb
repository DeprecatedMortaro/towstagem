module Towsta
  class Engine < Rails::Engine
    initializer 'towsta.initialize', :after => :disable_dependency_loading do |app|
      Towsta.models_path = "#{Rails.root}/app/models/"
    end
  end
end
