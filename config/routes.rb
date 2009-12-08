ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'cards'

  map.resources(:cards, :as => 'fichas') do |card|
    card.resources :slides
    card.resources :card_files
  end
  map.resources :colors, :as => 'colores'
  map.resources :tags, :as => 'categorias'
end
