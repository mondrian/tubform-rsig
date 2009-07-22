
ds= Ext::Data::Store.new({
      :proxy=> Ext::Data::HttpProxy.new({
                 :url=>"/rwt_faixa_de_descontos/index?format=json",
                 :method=> 'GET'
             }),
      :reader=> Ext::Data::JsonReader.new({
                  :root=> "faixa_de_desconto",
                  :id=> 'id',
                  :totalProperty=> 'results'
                  },
                  [
                    {:name=> 'id'},
                    {:name=> 'desconto_permitido'}
                  ]),
      :remoteSort=> true,
      :sortInfo=> {:field=> 'id', :direction=> 'ASC'}
  });

window('FaixaDeDesconto',350) do |w|
  w << grid(:ds=>ds,
            :tbar=>[button('x'),button('y')],
            :sm=> Ext::Grid::RowSelectionModel.new({:singleSelect=>true})
  ) do |g|
#    g << {:dataIndex=>'id',:header=>'#',:id=>'id'}
#    g << {:dataIndex=>'email',:header=>'xx'}
    g << {:dataIndex=>'desconto_permitido'}

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
