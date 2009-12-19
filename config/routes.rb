ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'
  map.lapanaderia '/lapanaderia', :controller => 'pages', :action => 'lapanaderia'
  map.indice '/indice', :controller => 'pages', :action => 'indice'
  map.seleccion '/seleccion', :controller => 'pages', :action => 'selection'

  map.resources(:slides, :path_prefix => 'admin') do |slide|
    slide.resources :slide_positions, :path_prefix => 'admin'
  end
  
  map.resources(:cards, :as => 'fichas', :path_prefix => 'admin') do |card|
    card.resources :card_files, :path_prefix => 'admin'
  end

  map.resources :colors, :as => 'colores', :path_prefix => 'admin'
  map.resources :tags, :as => 'categorias', :path_prefix => 'admin'
  map.connect '/:id', :controller => 'pages', :action => 'card'
  map.connect '/editar/:id', :controller => 'cards', :action => 'find'
end
