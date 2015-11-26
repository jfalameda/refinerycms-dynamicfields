module Refinery
  module Dynamicfields
    module Admin
      class DynamicfieldsController < ::Refinery::AdminController

        crudify :'refinery/dynamicfields/dynamicfield'

        before_action :attach_listings, only: [:create, :new, :edit, :update]
        
        def new
          @dynamicfield = Dynamicfields::Dynamicfield.new
        end

        private

        def attach_listings
          # Retrieving the list of available pages templates
          @valid_view_templates = Refinery::Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')

          # Listing all the pages
          @pages = Refinery::Page.all
        end

        def dynamicfield_params
            params.require(:dynamicfield).permit(
              :model_title,
              :criteria,
              :page_layout,
              :page_id,
              :position,
              dynamicform_fields_attributes: [ :id, :field_label, :field_id, :field_type, :_destroy]
            )
          end
      end
    end
  end
end
