module Extensions
	module PagesHelper

		def self.included(base)
	      base.class_eval do

	      	# Allows to retrieve a dynamic form value
	      	# for a given page id and field id.
	      	def get_field(field_id, page_id=@page.id)

	      		value = Refinery::Dynamicfields::DynamicformValue.find_by_page_and_field_id(page_id, field_id)
	      		if value
	      			field_type = value.dynamicform_field.field_type
	      			if(field_type == "string" || field_type == "text")
	      				return value[field_type+"_value"]
	      			end
	      			if(field_type == "image")
	      				return value.image
	      			end
	      			if(field_type == "file")
	      				return value.resource
	      			end
	      			if(field_type == "wyswyg")
	      				return value.text_value
	      			end
	      		else
	      			return ""
	      		end
	      	end

	      end

	    end

	end
end
