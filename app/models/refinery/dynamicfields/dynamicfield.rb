module Refinery
  module Dynamicfields
    class Dynamicfield < Refinery::Core::BaseModel

      has_many :dynamicform_fields, dependent: :destroy
      has_many :dynamicform_associations

      accepts_nested_attributes_for :dynamicform_fields, :allow_destroy => true

      validates :model_title, presence: true

      self.table_name = 'dynamicfields'

      after_save :track_changes
      after_save :create_model_association

      def track_changes
        if(criteria_changed?)
          if(criteria_was == "page_id")
            DynamicformAssociation.where(:page_id => page_id_was, :dynamicfield_id => id).destroy_all
          else
            DynamicformAssociation.joins(:page).where("refinery_pages.view_template" => page_layout_was, :dynamicfield_id => id).destroy_all
          end
        else
          if(page_id_changed?)
            DynamicformAssociation.where(:page_id => page_id_was, :dynamicfield_id => id).destroy_all
          end
          if(page_layout_changed?)
            DynamicformAssociation.joins(:page).where("refinery_pages.view_template" => page_layout_was, :dynamicfield_id => id).destroy_all
          end
        end
      end

      def create_model_association
        if(criteria == "page_id")
          page = Refinery::Page.find_by_id(page_id)
          page.attach_dynamicform_association(self)
        elsif(criteria == "page_layout")
          pages = Refinery::Page.where(:view_template => page_layout)
          pages.each do |page|
            page.attach_dynamicform_association(self)
          end
        end
      end

      def title
        "Dynamic form"
      end
    end
  end
end
