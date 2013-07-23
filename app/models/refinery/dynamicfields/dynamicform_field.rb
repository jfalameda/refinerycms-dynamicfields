module Refinery
  module Dynamicfields
    class DynamicformField < Refinery::Core::BaseModel
      self.table_name = 'dynamicform_fields'

      belongs_to :dynamicfield

      attr_accessible :page_id, :position, :dynamicfield_id, :field_label, :field_id, :field_type

    end
  end
end
