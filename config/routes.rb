Rails.application.routes.draw do
    devise_for :admins
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'static_pages#index'

    StaticPagesController.action_methods.each do |action|
        get "/#{action}", to: "static_pages##{action}", as: action.to_s
    end

    resources :albums do
        resources :photos, only: :create
    end
end
