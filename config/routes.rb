Rails.application.routes.draw do
  resources :movies
  resources :lists do
    resources :bookmarks
  end

  resources :bookmarks do
    delete :destroy, on: :member
  end

  # Define root path if needed
  # root "movies#index"
end
