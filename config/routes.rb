ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages'
  map.lapanaderia '/lapanaderia', :controller => 'pages', :action => 'lapanaderia'
  map.indice '/indice', :controller => 'pages', :action => 'indice'
  
  map.resources(:cards, :as => 'fichas', :path_prefix => 'admin') do |card|
    card.resources :slides, :path_prefix => 'admin'
    card.resources :card_files, :path_prefix => 'admin'
  end

  map.resources :selections, :as => 'seleccion', :path_prefix => 'admin'
  map.resources :colors, :as => 'colores', :path_prefix => 'admin'
  map.resources :tags, :as => 'categorias', :path_prefix => 'admin'
  map.connect '/:id', :controller => 'pages', :action => 'card'
end
