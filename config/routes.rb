Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create], param: :user_id do
        collection do
          get 'search', to: 'users#search'
        end
      end

      resources :clock_ins, only: [:create]
    end
  end
end
