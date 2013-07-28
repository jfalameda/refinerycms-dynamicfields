module Extensions
	module PagesHelper

		def self.included(base)
	      base.class_eval do

	      	# Allows to retrieve a dynamic form value
	      	# for a given page id and field id.
	      	def get_field(field_id)
	      		value = Refinery::Dynamicfields::DynamicformValue.find_by_page_and_field_id(@page.id, field_id)
	      		if value
	      			value[value.dynamicform_field.field_type+"_value"]
	      		else
	      			""
	      		end
	      	end

	      end

	    end

	end
end