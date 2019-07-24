module ActiveModel
  class Errors
    def full_message(attribute, message)
      return message if attribute == :base
      attr_name = attribute.to_s.gsub('.', '_').humanize
      attr_name = @base.class.human_attribute_name(attribute, :default => attr_name)
      options = { :default => "%{attribute} %{message}", :attribute => attr_name }
      if message =~ /^\^/
        I18n.t(:"errors.format.full_message", options.merge(:message => message[1..-1], :default => "%{message}"))
      else
        I18n.t(:"errors.format", options.merge(:message => message))
      end
    end
  end
end
