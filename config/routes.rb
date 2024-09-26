Rails.application.routes.draw do
    root 'home#index'
    
    resource :registration
    resource :session
    resource :password_reset
    resource :password

    # resources :patients
    resources :patients do
        collection do
            get 'graph' # This creates a route for graph_patients_path
        end
    end

end
