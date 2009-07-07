JJWorks.JActionInspect = function(options, success, response) {
  return function(options, success, response) {
    if(success) {
      grid.store.reload();
    } else {
      Ext.Msg.show({
        icon: Ext.MessageBox.WARNING,
        buttons: Ext.Msg.OK,
        title:'Atenção',
        msg: response.responseText
      });
    };
  };
};

