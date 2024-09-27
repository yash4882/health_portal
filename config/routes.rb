Rails.application.routes.draw do
    root 'patients#index'
    
    resource :registration
    resource :session
    resource :password_reset
    resource :password

    resources :patients do
        collection do
            get 'patient'
        end
    end
end
