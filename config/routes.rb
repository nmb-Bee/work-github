Rails.application.routes.draw do
# 管理者側
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  root 'admin/sessions#top'
  namespace :admin do
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update,]
    resources :order_items, only: [:update]
    resources :items, exept: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  

# 顧客側
  devise_for :customers, controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }
  root 'items#top'
  get '/about' => 'items#about', as: 'about'
  
  namespace :customer do
    resources :items, only: [:index, :show]
    resources :orders, only: [:new,  :create,  :index, :show] do
      collection do
        get 'log'
        get 'thanks'
      end
    end
    resources :customers, only: [:show, :edit, :update, :quit, :out] do
      collection do
        get 'quit'
        patch 'out'
      end
    end
  end
  
  scope :customer do
    resources :carts, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'all_destroy'
      end
    end
    resources :addresses, exept: [:new, :show]
  end
end