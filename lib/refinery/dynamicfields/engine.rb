module Refinery
  module Dynamicfields
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Dynamicfields

      engine_name :refinery_dynamicfields

      config.before_initialize do
        require root+'lib/extensions/pages_controller_extensions'
        require root+'lib/extensions/pages_helper_extensions'
        require root+'lib/extensions/pages_model_extensions'
      end


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

      def self.register(tab)
        # Filling the tab information
        tab.name = ::I18n.t(:'refinery.plugins.dynamicfields.tab_name')
        tab.partial = "/refinery/dynamicfields/admin/pages/tabs/custom_fields"
        
      end

      def self.initialize_tab!
        # Registering the tab on pages
        Refinery::Pages::Tab.register { |tab| register tab }
      end

      config.after_initialize do
        initialize_tab!
        Refinery.register_extension(Refinery::Dynamicfields)
      end

      config.to_prepare do

        Refinery::Admin::PagesController.send :include, Extensions::PagesController
        Refinery::Pages::ContentPagesHelper.send :include, Extensions::PagesHelper
        Refinery::Page.send :include, Extensions::Page

        
      end

    end
  end
end
