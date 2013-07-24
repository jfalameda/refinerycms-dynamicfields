module Extensions
	module PagesController

		def self.included(base)
	      base.class_eval do

	      		before_filter :add_dynamic_fields, :only => [:new, :edit]

	      		private

	      			def add_dynamic_fields
	      				@dynamicfields = Refinery::Dynamicfields::Dynamicfield.where(:criteria => "page_id", :page_id => params[:id])
	      				byebug
	      			end

	      end

	    end

	end
end