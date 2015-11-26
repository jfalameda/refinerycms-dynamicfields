module Extensions
	module Page

    def self.included(base)

      base.class_eval do

      	has_many :dynamicform_associations, :class_name => 'Refinery::Dynamicfields::DynamicformAssociation'
		    accepts_nested_attributes_for :dynamicform_associations
		    
        # TODO : Add permit params (rails 4+)
        # attr_accessible :dynamicform_associations_attributes

      	# This function creates a new dynamic form association
		    # for pages. It clones a given dynamicfield object and
		    # and attaches to a page.
		    def attach_dynamicform_association(dynamicfields)
      		results = Refinery::Dynamicfields::DynamicformAssociation.where(:page_id => id, :dynamicfield_id => dynamicfields.id)
      		if results.empty? then

  					# Create a new dynamic form association
  					dynamicform_association = Refinery::Dynamicfields::DynamicformAssociation.new
  					
  					# Attaching the dynamic and page information
  					dynamicform_association.page_id = id
  					dynamicform_association.dynamicfield_id = dynamicfields.id
  					dynamicform_association.clone_dynamicform(dynamicfields)
  					dynamicform_association.save
  				end
				end

	    end
	  end
	end
end