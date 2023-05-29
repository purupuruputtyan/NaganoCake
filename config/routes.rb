Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :item, only: [:index, :show]
  resource :customer, only: [:show, :edit, :update] do
    collection do
      get :confirm_deleted
      patch :is_deleted
    end
  end
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    get 'destroy_all', on: :member
  end
end

namespace :admin do

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
