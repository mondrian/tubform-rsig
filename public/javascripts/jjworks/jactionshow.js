JJWorks.JActionShow = function(entity, entities) {
  return function() {
    try {
      id = grid.getSelectionModel().getSelected().get('id');
        janela = new JJWorks.JWindow({
        title:'Exibir '+entity,
        autoLoad:{
          url: '/' + entities + '/show/' + id
        }
      });
      janela.show();
    } catch(e) {
      Ext.Msg.show({
      icon: Ext.MessageBox.WARNING,
      buttons: Ext.Msg.OK,
      title:'Atenção',
      msg:'Selecione um registro para exibição!'
    });
  };
 }
};

