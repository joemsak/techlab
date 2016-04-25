Rails.application.routes.draw do
  resources :channels, only: [] do
    get :chronological, on: :collection
  end

  root to: "channels#chronological"
end
