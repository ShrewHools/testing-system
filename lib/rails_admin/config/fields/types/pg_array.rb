module RailsAdmin
  module Config
    module Fields
      module Types
        class PgArray < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :formatted_value do
            value.join("\r\n")
          end

          register_instance_option :pretty_value do
            value.join('<br>').html_safe
          end

          def parse_value(value)
            value.to_s.split("\r\n").delete_if(&:empty?)
          end

          def parse_input(params)
            params[name] = parse_value(params[name]) if params[name].is_a?(::String)
          end
        end
      end
    end
  end
end
