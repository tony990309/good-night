Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create], param: :user_id do
        collection do
          get 'search'
        end
      end

      namespace :users do
        scope module: :follow do
          post 'follow'
          post 'unfollow'
        end

        scope module: :clock_in do
          post 'clock_in'
        end
      end

      resources :sleep_durations, only: [:index]
    end
  end
end
