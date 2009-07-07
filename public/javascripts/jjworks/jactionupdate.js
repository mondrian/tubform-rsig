JJWorks.JActionUpdate = function(entity, entities) {
  return function() {
    var id = grid.getSelectionModel().getSelected().get('id');
    Ext.Ajax.request({
      url:'/'+entities+'/'+id,
      form: 'edit_'+entity+'_'+id,
      method:'PUT',
      callback: function(options, success, response) {
        if(success) {
          grid.store.reload();
          janela.close();
        } else {
          Ext.Msg.show({
            icon: Ext.MessageBox.WARNING,
            buttons: Ext.Msg.OK,
            title:'Atenção',
            msg: response.responseText
          });
        };
      }
    });
  };
};

