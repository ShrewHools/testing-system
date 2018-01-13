module RailsAdmin
  module Config
    module Fields
      module Types
        class Tokenfield < RailsAdmin::Config::Fields::Types::String
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :formatted_value do
            value.join(', ')
          end

          register_instance_option :pretty_value do
            value.join(', ')
          end

          register_instance_option :html_attributes do
            { size: input_size, data: { role: 'tokenfield' } }
          end

          def parse_value(value)
            value.split(',').map(&:strip).delete_if(&:empty?)
          end

          def parse_input(params)
            params[name] = parse_value(params[name]) if params[name].is_a?(::String)
          end
        end
      end
    end
  end
end
