module RailsAdmin
  module Config
    module Fields
      module Types
        class StringSanitize < RailsAdmin::Config::Fields::Types::String
          include ActionView::Helpers::SanitizeHelper

          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :pretty_value do
            sanitize(value, tags: [])
          end
        end
      end
    end
  end
end
