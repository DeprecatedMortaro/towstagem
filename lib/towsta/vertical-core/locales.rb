module Towsta

  class VerticalCore

    include R18n::Helpers

    def i18n attr
      self.send :"#{attr.to_s}_#{R18n.get.locales.first.code}"
    end

    def method_missing meth, *args, &block
      begin
        return self.i18n meth.to_sym
      rescue
        super
      end
    end

  end

end
