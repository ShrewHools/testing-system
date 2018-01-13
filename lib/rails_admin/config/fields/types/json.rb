module RailsAdmin
  module Config
    module Fields
      module Types
        class Json < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Types.register(self)
          RailsAdmin::Config::Fields::Types.register(:jsonb, self)

          register_instance_option :formatted_value do
            value.present? ? JSON.pretty_generate(value) : '{}'
          end

          def parse_value(value)
            value.present? ? JSON.parse(value) : {}
          end
        end
      end
    end
  end
end
