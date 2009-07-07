JJWorks.JActionCreate = function(entity, entities) {
  return function() {
    janela = new JJWorks.JWindow({
      title: 'Novo ' + entity,
      autoLoad: {
        url: '/' + entities + '/new'
      },
      buttons:[{
        text: 'Salvar',
        handler: save
      }]
    });
    janela.show();
  }
};

