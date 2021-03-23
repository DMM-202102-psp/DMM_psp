Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }

  namespace :admin do
    root 'homes#top'
    resources :sessions
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :registrations
    resources :sessions
    resource :customers, only: [:show, :edit, :update] do
      member do
        patch 'withdrawal'
        get 'unscraibe'
      end
    end
    resources :carts, only: [:index, :update, :destroy, :create] do
      member do
        delete 'destroy_all' # routeにid含むのは問題ないか？
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      member do
        get 'complete'
      end
    end
    post '/orders/confirm' => 'orders#confirm', as: 'confirm_order'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
