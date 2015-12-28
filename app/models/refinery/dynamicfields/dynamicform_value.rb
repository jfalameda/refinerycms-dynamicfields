module Refinery
	module Dynamicfields
		class DynamicformValue < Refinery::Core::BaseModel

			belongs_to :dynamicform_field
			belongs_to :dynamicform_association, dependent: :destroy
			belongs_to :page			
			belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :resource, :class_name => '::Refinery::Resource'

			def self.find_by_page_and_field_id(page_id, field_id)
		    self.joins(:dynamicform_association, :dynamicform_field).where("#{::Refinery::Dynamicfields::DynamicformAssociation.table_name}.page_id" => page_id, "#{::Refinery::Dynamicfields::DynamicformField.table_name}.field_id" => field_id).first
		  end
		end
	end
end
