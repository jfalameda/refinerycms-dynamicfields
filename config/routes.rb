Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :dynamicfields do
    resources :dynamicfields, :path => '', :only => [:index, :show]
  end

  resources :dynamicform_fields
  resources :dynamicform_values
  resources :dynamicform_associations

  # Admin routes
  namespace :dynamicfields, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :dynamicfields, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
