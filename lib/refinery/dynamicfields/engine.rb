module Refinery
  module Dynamicfields
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Dynamicfields

      engine_name :refinery_dynamicfields

      initializer "register refinerycms_dynamicfields plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "dynamicfields"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.dynamicfields_admin_dynamicfields_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/dynamicfields/dynamicfield'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Dynamicfields)
      end
    end
  end
end
