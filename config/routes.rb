ActionController::Routing::Routes.draw do |map|
  map.resources :parametros

  map.resources :classes

  map.resources :fornecedores

  map.resources :notas_fiscais
  map.resources :itens_nota_fiscal

  map.root :controller => "home"
  #map.root :controller => 'sessions', :action => 'new'
  map.resources :acoes

  map.resources :contra_partidas

  map.resources :lancamentos

  map.resources :duplicatas
  map.resources :produto_kits
  map.resources :item_pedido_kits
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'

  map.resource :session

  map.resources :faixa_de_descontos
  map.resources :produtos
  map.resources :item_pedidos
  #map.root :controller => 'sessions', :action => 'index'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
     map.resources :pedidos, :collection => { :comissao_acordada => :get, :permitir_desconto_no_pedido => :get , :nota_fiscal_populada_via_pedido => :get }
     map.resources :impressao_nota, :collection => { :dados_nota => :get }
     map.resources :clientes

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

