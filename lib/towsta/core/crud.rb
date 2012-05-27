module Towsta

  class Core

    attr_accessor :message

    def update args, author=Towsta.author
      args.each {|k,v| self.send("#{k}=".to_sym, v)}
      self.save author
    end

    def destroy
      #to-do
    end

    def save creator=Towsta.author
      creator = author.email if author
      export = self.attributes
      export.delete :author
      export.delete :created_at
      export.delete :updated_at
      id_aux = export.delete(:id)
      id_aux ? id_aux : '0'
      export = {:creator => creator, :vertical => self.class.to_s, :attributes => export, :id => id_aux}
      response = Towsta::Synchronizer.save_request export
      @message = response[:message]
      self.id = response[:id] if response[:status]
      self.author = User.find_by_email creator
      response[:status]
    end

    def self.create args, creator=Towsta.author
      new = self.new(args.merge(:id => nil))
      new.save creator
      new
    end

  end

end
