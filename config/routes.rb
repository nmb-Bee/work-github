Rails.application.routes.draw do

# 管理者側
  #scope module: :admin do
    devise_for :admins
  #
  # , controllers: {
  #   sessions:      'admin/sessions',
  #   passwords:     'admin/passwords',
  #   registrations: 'admin/registrations'
  # }
  # root 'admin/sessions#top'
  namespace :admin do
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update,]
    resources :order_items, only: [:update]
    get '/top' => 'items#top', as: 'top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end


# 顧客側
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  root 'customer/items#top'
  get '/about' => 'customer/items#about', as: 'about'

  scope module: :customer do
    scope 'customers' do

      resources :items, only: [:index, :show]
      resources :orders, only: [:new,  :create,  :index, :show] do
       collection do
          get 'log'
          get 'thanks'
        end
      end
      resource :customers, only: [:show, :edit, :update, :quit, :out] do
        collection do
          get 'quit'
          patch 'out'
       end
     end
     resources :carts, only: [:index, :create, :update, :destroy] do
       collection do
         delete 'all_destroy'
       end
     end
     resources :addresses, only: [:index, :create, :edit, :update, :destroy]
   end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end