Rails.application.routes.draw do
  get "search/index", to: "search#index", as: "search_index"
  get "search/get/:data", to: "search#get", as: "search_get"
  post "search", to: "search#search", as: "search_search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"

  get "registration", to: "users#new"
  post "registration", to: "users#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :genres
  resources :artists
  resources :albums
  resources :songs
  resources :playlists

  get "playlist_song/:song_id", to: "playlists#song_to_playlist_new", as: "playlist_song"
  post "playlist_song_add", to: "playlists#add_song_to_playlist", as: "playlist_song_add"

end
