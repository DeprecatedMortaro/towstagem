module Towsta

  class Core

    def to_mail
      string = ''
      meta_attributes.each { |attribute, value| string << "<b>#{attribute.to_s}:</b> #{value} <br/>" }
      string
    end

  end

end
