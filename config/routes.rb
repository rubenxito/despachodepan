ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'cards'
  map.resources :cards
end
