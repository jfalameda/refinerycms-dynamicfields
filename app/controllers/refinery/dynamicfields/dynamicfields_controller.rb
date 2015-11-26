module Refinery
  module Dynamicfields
    class DynamicfieldsController < ::ApplicationController

      before_action :find_all_dynamicfields
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dynamicfield in the line below:
        present(@page)
      end

      def show
        @dynamicfield = Dynamicfield.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @dynamicfield in the line below:
        present(@page)
      end

    protected

      def find_all_dynamicfields
        @dynamicfields = Dynamicfield.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/dynamicfields").first
      end

    end
  end
end
