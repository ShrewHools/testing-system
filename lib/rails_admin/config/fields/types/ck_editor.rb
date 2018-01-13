module RailsAdmin
  module Config
    module Fields
      module Types
        class CKEditor < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :pretty_value do
            value.html_safe
          end
        end
      end
    end
  end
end
