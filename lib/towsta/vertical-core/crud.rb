module Towsta

  class VerticalCore

    attr_accessor :message

    def update args, author=$towsta_default_author
      args.each {|k,v| self.send("#{k}=".to_sym, v)}
      self.save author
    end

    def destroy
      #to-do
    end

    def save creator=$towsta_default_author
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
      Towsta::Memory.flush if $towsta_cache
      response[:status]
    end

    def self.create args, creator=$towsta_default_author
      new = self.new(args.merge(:id => nil))
      new.save creator
      new
    end

  end

end
