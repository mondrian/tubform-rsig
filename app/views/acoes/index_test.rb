ds= Ext::Data::Store.new({
      :proxy=> Ext::Data::HttpProxy.new({
                 :url=>"/rwt_contacts/index?format=json",
                 :method=> 'GET'
             }),
      :reader=> Ext::Data::JsonReader.new({
                  :root=> "acao",
                  :id=> 'id',
                  :totalProperty=> 'results'
                  },
                  [
                    {:name=> 'id'},
                    {:name=> 'controller_name'},
                    {:name=> 'action_name'},
                  ]),
      :remoteSort=> true,
      :sortInfo=> {:field=> 'id', :direction=> 'ASC'}
  });

window('Acoes',350) do |w|
  w << grid(:ds=>ds,
            :tbar=>[button('x'),button('y')],
            :sm=> Ext::Grid::RowSelectionModel.new({:singleSelect=>true})
  ) do |g|
#    g << {:dataIndex=>'id',:header=>'#',:id=>'id'}
    g << {:dataIndex=>'controller_name',:header=>'xx'}
    g << {:dataIndex=>'action_name'}

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
