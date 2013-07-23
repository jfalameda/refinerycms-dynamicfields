module Refinery
  module Dynamicfields
    module Admin
      class DynamicfieldsController < ::Refinery::AdminController

        crudify :'refinery/dynamicfields/dynamicfield', :xhr_paging => true

        def new
          # Retrieving the list of available pages templates
          @valid_view_templates = Refinery::Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')

          # Creating a new Dynamicfield object
        	@dynamicfield = Dynamicfields::Dynamicfield.new

          # Listing all the pages
          @pages = Refinery::Page.all

          # Building the nested forms in case they are not already build
          @dynamicfield.dynamicform_fields.build if @dynamicfield.dynamicform_fields.empty?
        end

      end
    end
  end
end
