module Refinery
  module Dynamicfields
    module Admin
      class DynamicfieldsController < ::Refinery::AdminController

        crudify :'refinery/dynamicfields/dynamicfield', :xhr_paging => true

        before_action :attach_listings, only: [:create, :new, :edit, :update]
        
        def new

          # Creating a new Dynamicfield object
          @dynamicfield = Dynamicfields::Dynamicfield.new          

        end

        private

          def attach_listings
            # Retrieving the list of available pages templates
            @valid_view_templates = Refinery::Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')

            # Listing all the pages
            @pages = Refinery::Page.all
          end


        
      end
    end
  end
end
