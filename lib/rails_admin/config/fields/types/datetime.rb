module RailsAdmin
  module Config
    module Fields
      module Types
        class Datetime < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(self)
          
          register_instance_option :strftime_format do
            '%d.%m.%Y %H:%M'
          end
        end
      end
    end
  end
end
