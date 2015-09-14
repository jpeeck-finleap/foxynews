Foxynews::Engine.routes.draw do

  get 'pressrooms' => 'pressrooms#index', as: 'pressrooms'
  get 'pressrooms/show/:id(/:title)' => 'pressrooms#show', as: 'pressroom'
  get 'pressrooms/archive' => 'pressrooms#archive', as: 'pressroom_archive'
  get 'presskit/show/:id(/:title)' => 'presskits#show', as: 'presskit'

  root 'pressrooms#index'
end
