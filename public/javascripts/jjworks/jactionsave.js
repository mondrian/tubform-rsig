JJWorks.JActionSave = function(entity, entities) {
  return function() {
  Ext.Ajax.request({
    url:'/'+entities,
    form: 'new_'+entity,
    method:'POST',
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

