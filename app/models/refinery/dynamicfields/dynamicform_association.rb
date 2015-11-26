module Refinery
	module Dynamicfields
		class DynamicformAssociation < Refinery::Core::BaseModel
			self.table_name = 'dynamicform_associations'

			has_many :dynamicform_values

			belongs_to :dynamicfield
			belongs_to :page, :class_name => "Refinery::Page"

			accepts_nested_attributes_for :dynamicform_values

			def clone_dynamicform(dynamicform)
				dynamicform.dynamicform_fields.each do |dynamicform_field|
					update_dynamicform(dynamicform_field)
				end
			end

			def update_dynamicform(dynamicform_field)
				value = Refinery::Dynamicfields::DynamicformValue.new
				# Attaching to the model field
				value.dynamicform_field_id = dynamicform_field.id
				dynamicform_values << value
			end
		end
	end
end