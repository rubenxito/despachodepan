ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages'
  map.lapanaderia '/lapanaderia', :controller => 'pages', :action => 'lapanaderia'
  map.indice '/indice', :controller => 'pages', :action => 'indice'
  
  map.resources(:cards, :as => 'fichas') do |card|
    card.resources :slides
    card.resources :card_files
  end
  map.resources :colors, :as => 'colores'
  map.resources :tags, :as => 'categorias'
  map.connect '/:id', :controller => 'pages', :action => 'card'
end
