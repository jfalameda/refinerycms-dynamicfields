module Refinery
  module Dynamicfields
    class Dynamicfield < Refinery::Core::BaseModel

      has_many :dynamicform_fields

      accepts_nested_attributes_for :dynamicform_fields

      validates :model_name, presence: true

      self.table_name = 'dynamicfields'

      attr_accessible :criteria, :page_layout, :model_name, :position, :dynamicform_fields, :dynamicform_fields_attributes

      def title
        "Dynamic form"
      end
    end
  end
end
