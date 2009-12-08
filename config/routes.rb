ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'cards'
  map.resources(:cards, :as => 'fichas') do |card|
    card.resources :slides
  end
end
