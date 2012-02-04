module Towsta

  class VerticalCore

    def to_mail
      string = ''
      meta_attributes.each { |attribute, value| string << "<b>#{attribute.to_s}:</b> #{value} <br/>" }
      string
    end

    def notify args
      Pony.mail({:html_body => to_mail}.merge(args))
    end

  end

end
