JJWorks.CRUDActions = new function(){
  return {
    add: function(entitySingular, entityPlural) {
      janela = new JJWorks.Window({
        title: 'Novo ' + entitySingular,
        autoLoad: {
          scripts: true,
          url: '/' + entityPlural + '/new.js'
        }
      });
      janela.show();
    },

    edit: function(entitySingular, entityPlural) {
      alert(entitySingular);
    },
    remove: function(entitySingular, entityPlural) {
      alert(entitySingular);
    }
  }
}();

