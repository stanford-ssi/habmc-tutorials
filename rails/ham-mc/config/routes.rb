Rails.application.routes.draw do

  post 'transmissions/create_random' => 'transmissions#create_random'

  resources :transmissions

  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
