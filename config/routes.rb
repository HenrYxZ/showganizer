Showganizer::Application.routes.draw do

  resources :reviews, only: [:index, :show, :create, :update, :destroy]

  get "watchlist/shows"
  get "watchlist/movies"
  get "watchlist/series"
  get "watchlist/seasons"
  get "watchlist/episodes"
  get "watchlist/", to: "watchlist#index"
  get "seen/shows"
  get "seen/movies"
  get "seen/series", as: "seen_all_series"
  get "seen/seasons"
  get "seen/episodes"
  get "shows/category/:category", to: "shows#category"
  get "series/category/:category", to: "series#category"
  get "movies/category/:category", to: "movies#category"

  
  resources :shows do
    member do
      get 'seen'
      get 'unseen'
      get 'add_to_watchlist'
      get 'remove_from_watchlist'
      get 'add_trailer'
      get 'remove_trailer'
    end
  end

  resources :shows do
    resources :photo_shows
    resources :link_shows
    resources :movies do
      member do
        get 'seen'
        get 'unseen'
        get 'add_to_watchlist'
        get 'remove_from_watchlist'
        get 'add_trailer'
        get 'remove_trailer'
      end
    end
    resources :series do
      member do
        get 'seen'
        get 'unseen'
        get 'add_to_watchlist'
        get 'remove_from_watchlist'
        get 'add_trailer'
        get 'remove_trailer'
      end
    end
  end

  resources :movies do
    resources :link_movies
    resources :photo_movies
  end

  resources :series do
    resources :link_series
    resources :photo_series
    resources :seasons do
      member do
        get 'seen'
        get 'unseen'
        get 'add_to_watchlist'
        get 'remove_from_watchlist'
        get 'add_trailer'
        get 'remove_trailer'
      end
    end
  end

  resources :seasons do
    resources :link_seasons
    resources :photo_seasons
    resources :episodes do
      member do
        get 'seen'
        get 'unseen'
        get 'add_to_watchlist'
        get 'remove_from_watchlist'
        get 'add_trailer'
        get 'remove_trailer'
      end
    end
  end

  resources :users

  resource :session, only: [:new, :create, :destroy]

  resources :movies do
    member do
      get 'seen'
      get 'unseen'
      get 'add_to_watchlist'
      get 'remove_from_watchlist'
      get 'add_trailer'
      get 'remove_trailer'
    end
  end

  resources :series do
    member do
      get 'seen'
      get 'unseen'
      get 'add_to_watchlist'
      get 'remove_from_watchlist'
      get 'add_trailer'
      get 'remove_trailer'
    end
  end

  resources :seasons do
    member do
      get 'seen'
      get 'unseen'
      get 'add_to_watchlist'
      get 'remove_from_watchlist'
      get 'add_trailer'
      get 'remove_trailer'
    end
  end

  resources :episodes do
    resources :photo_episodes
    resources :link_episodes
    member do
      get 'seen'
      get 'unseen'
      get 'add_to_watchlist'
      get 'remove_from_watchlist'
      get 'add_trailer'
      get 'remove_trailer'
    end
  end

  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'shows#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
