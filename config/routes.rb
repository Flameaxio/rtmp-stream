Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'

  post '/update_stream', to: 'api/v1/streams#update_stream'

  resources :users, only: [:show] do
    resources :chat_messages, only: [:create]
  end

  direct :thumbnail do |model|
    "#{request.protocol}#{request.host}:20080/app/#{model.handle}/thumb.jpg"
  end

  direct :stream do |model|
    "ws://#{request.host}:3333/app/#{model.handle}/webrtc"
  end
end
