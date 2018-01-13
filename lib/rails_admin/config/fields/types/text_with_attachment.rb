module RailsAdmin
  module Config
    module Fields
      module Types
        class TextWithAttachment < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :pretty_value do
            attachment = bindings[:object].attachments.where(purpose: name).first
            bindings[:view].display_attachment(attachment) + value
          end

          register_instance_option :formatted_value do
            value || bindings[:object].attachments.where(purpose: name).first
          end
        end
      end
    end
  end
end
