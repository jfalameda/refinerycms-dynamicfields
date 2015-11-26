Refinery::Admin::PagesController.prepend(
  Module.new do
    def permitted_page_params
      super << [ dynamicform_associations_attributes: [ :id, dynamicform_values_attributes: [ :id, :text_value, :resource_id, :image_id, :string_value, :integer_value ] ] ]
    end
  end
)