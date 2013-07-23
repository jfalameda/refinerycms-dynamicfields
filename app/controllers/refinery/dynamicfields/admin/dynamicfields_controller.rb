module Refinery
  module Dynamicfields
    module Admin
      class DynamicfieldsController < ::Refinery::AdminController

        crudify :'refinery/dynamicfields/dynamicfield', :xhr_paging => true

        # @override
        def new
          # Retrieving the list of available pages templates
          @valid_view_templates = Refinery::Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')

          # Creating a new Dynamicfield object
        	@dynamicfield = Dynamicfields::Dynamicfield.new

          # Listing all the pages
          @pages = Refinery::Page.all

          # Building the nested forms in case they are not already build
          @dynamicfield.dynamicform_fields.build if @dynamicfield.dynamicform_fields.empty?
        end

        # @override
        def create

          # Retrieving the list of available pages templates
          @valid_view_templates = Refinery::Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')

          # Listing all the pages
          @pages = Refinery::Page.all

          if (@dynamicfield = Dynamicfield.create(params[:dynamicfield])).valid?
            flash.notice = t(
              'refinery.crudify.created',
              :what => "'\#{@dynamicfield.#{options[:title_attribute]}}'"
            )

            unless from_dialog?
              unless params[:continue_editing] =~ /true|on|1/
                redirect_back_or_default("refinery.#{Refinery.route_for_model(:dynamicfield, :plural => true)}")
              else
                unless request.xhr?
                  redirect_to :back
                else
                  render :partial => '/refinery/message'
                end
              end
            else
              self.index
              @dialog_successful = true
              render :index
            end
          else
            unless request.xhr?
              render :action => 'new'
            else
              render :partial => '/refinery/admin/error_messages', :locals => {
                       :object => @dynamicfield,
                       :include_object_name => true
                     }
            end
          end
        end
        
      end
    end
  end
end
