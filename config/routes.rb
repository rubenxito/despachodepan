ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'actual'
  map.lapanaderia '/lapanaderia', :controller => 'pages', :action => 'lapanaderia'
  map.indice '/procesos', :controller => 'pages', :action => 'indice'
  map.seleccion '/seleccion', :controller => 'pages', :action => 'selection'
  map.actual '/noticias', :controller => 'pages', :action => 'actual'
  map.thumb '/thumb/:id', :controller => 'pages', :action => 'thumb'
  map.index '/index', :controller => 'pages', :action => 'index'

  #map.connect '/admin', :controller => 'maintenance', :action => 'read_only'
  #map.connect '/admin/*all', :controller => 'maintenance', :action => 'read_only'

  map.resources(:slides, :path_prefix => 'admin') do |slide|
    slide.resource :position, :controller => 'slide_positions', :as => 'position', :member => { :up => :get, :down => :get }
  end

  map.connect '/admin', :controller => 'cards', :action => 'index'
  map.resources(:cards, :as => 'fichas', :path_prefix => 'admin') do |card|
    card.resources :card_files,  :as => 'ficheros'
  end

  map.resources(:tags, :as => 'categorias', :path_prefix => 'admin') do |tag|
    tag.resource :position, :controller => 'tag_positions', :as => 'position', :member => { :up => :get, :down => :get, :top => :get, :bottom => :get, :reorder => :get }
  end

  map.resources :colors, :as => 'colores', :path_prefix => 'admin'

  map.connect '/:id', :controller => 'pages', :action => 'card'
  map.connect '/editar/:id', :controller => 'cards', :action => 'find'
end
