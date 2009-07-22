ds= Ext::Data::Store.new({
      :proxy=> Ext::Data::HttpProxy.new({
                 :url=>"/rwt_duplicatas/index?format=json",
                 :method=> 'GET'
             }),
      :reader=> Ext::Data::JsonReader.new({
                  :root=> "duplicata",
                  :id=> 'id',
                  :totalProperty=> 'results'
                  },
                  [
                    {:name=> 'id'},
                    {:name=> 'valor'}
                  ]),
      :remoteSort=> true,
      :sortInfo=> {:field=> 'id', :direction=> 'ASC'}
  });

window('Duplicatas',350) do |w|
  w << grid(:ds=>ds,
            :tbar=>[button('x'),button('y')],
            :sm=> Ext::Grid::RowSelectionModel.new({:singleSelect=>true})
  ) do |g|
#    g << {:dataIndex=>'id',:header=>'#',:id=>'id'}
#    g << {:dataIndex=>'email',:header=>'xx'}
    g << {:dataIndex=>'valor'}

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

