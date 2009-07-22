ds= Ext::Data::Store.new({
      :proxy=> Ext::Data::HttpProxy.new({
                 :url=>"/rwt_contacts/index?format=json",
                 :method=> 'GET'
             }),
      :reader=> Ext::Data::JsonReader.new({
                  :root=> "componentes_pedido_de_assistencia",
                  :id=> 'id',
                  :totalProperty=> 'results'
                  },
                  [
                    {:name=> 'pedido_id'},
                    {:name=> 'produto'},
                    {:name=> 'quantidade'},
                    {:name=> 'valor'}
                    {:name=> 'sequencia_movimento'}
                    {:name=> 'emite_relatorio'}
                    {:name=> 'produto_id'}
                    {:name=> 'justificativa'}
                    {:name=> 'motivo_id'}
                    {:name=> 'componentes'}
                  ]),
      :remoteSort=> true,
      :sortInfo=> {:field=> 'id', :direction=> 'ASC'}
  });

window('Componentes_pedido_de_assistencia',350) do |w|
  w << grid(:ds=>ds,
            :tbar=>[button('x'),button('y')],
            :sm=> Ext::Grid::RowSelectionModel.new({:singleSelect=>true})
  ) do |g|
#    g << {:dataIndex=>'id',:header=>'#',:id=>'id'}
    g << {:dataIndex=>'produto',:header=>'xx'}
    g << {:dataIndex=>'quantidade'}
    g << {:dataIndex=>'sequencia_movimento'}
    g << {:dataIndex=>'emite_relatorio'}
    g << {:dataIndex=>'produto_id'}
    g << {:dataIndex=>'justificativa'}
    g << {:dataIndex=>'motivo_id'}
    g << {:dataIndex=>'componentes'}


    w.config[:listeners]= {} unless w.config[:listeners]
    w.config[:listeners].merge!(:show=>function(
                                            "Rwt.debug('aftershow');",
                                            "App.xx=#{g.jsObject};",
                                            "#{g.jsObject}.getStore().reload();"
                                          )
                                )
  end
  w.show
end

