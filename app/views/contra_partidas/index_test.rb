ds= Ext::Data::Store.new({
      :proxy=> Ext::Data::HttpProxy.new({
                 :url=>"/rwt_contacts/index?format=json",
                 :method=> 'GET'
             }),
      :reader=> Ext::Data::JsonReader.new({
                  :root=> "contra_partida",
                  :id=> 'id',
                  :totalProperty=> 'results'
                  },
                  [
                    {:name=> 'lancamento_id'},
                    {:name=> 'plano_de_conta_id'},
                    {:name=> 'duplicata_id'},
                    {:name=> 'valor_lancamento'}
                    {:name=> 'tipo_operaao'}
                    {:name=> 'historico'}

                  ]),
      :remoteSort=> true,
      :sortInfo=> {:field=> 'id', :direction=> 'ASC'}
  });

window('Contra_partidas',350) do |w|
  w << grid(:ds=>ds,
            :tbar=>[button('x'),button('y')],
            :sm=> Ext::Grid::RowSelectionModel.new({:singleSelect=>true})
  ) do |g|
#    g << {:dataIndex=>'id',:header=>'#',:id=>'id'}
    g << {:dataIndex=>'lancamento_id',:header=>'xx'}
    g << {:dataIndex=>'plano_de_conta_id'}
    g << {:dataIndex=>'duplicata_id'}
    g << {:dataIndex=>'valor_lancamento'}
    g << {:dataIndex=>'tipo_operacao'}
    g << {:dataIndex=>'historico'}


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

