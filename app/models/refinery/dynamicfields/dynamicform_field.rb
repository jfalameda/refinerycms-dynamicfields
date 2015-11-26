module Refinery
  module Dynamicfields
    class DynamicformField < Refinery::Core::BaseModel

      validate :correct_field_id

		  def correct_field_id
		    if field_id !~ /^[a-zA-Z_][a-zA-Z0-9_]*$/
		    	errors.add(:field_id, ::I18n.t('refinery.dynamicfields.admin.dynamicfields.errors.invalid_id'))
		    end
		  end

      belongs_to :dynamicfield

      has_many :dynamicform_values, dependent: :destroy

      validates :field_label, :field_id, :field_type, presence: true

      after_create :update_dynamicform_associations

      def update_dynamicform_associations
  			if associations = dynamicfield.dynamicform_associations
  				associations.each do |association|
  					association.update_dynamicform(self)
  				end
  			end
  		end

    end
  end
end
