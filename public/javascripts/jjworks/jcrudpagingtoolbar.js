JJWorks.JCrudPagingToolbar = Ext.extend(Ext.PagingToolbar, {
  constructor: function (config) {

    // Aplica qualquer coisa especificada no objeto de configuração a esse objeto
    Ext.apply(this, config);

    Ext.apply(this, {
      pageSize:5,
      displayInfo: true,
      items: ['-', {
        text: 'Exibir',
        handler: show
      },{
        text: 'Novo',
        handler: create
      },{
        text: 'Alterar',
        handler: edit
      }, {
        text: 'Excluir',
        handler: destroy
      }]
    });

    JJWorks.JCrudPagingToolbar.superclass.constructor.call(this);
  },

  doLoad : function(start){
    var o = {}, pn = this.paramNames;
    o[pn.start] = start;
    o[pn.limit] = this.pageSize;
    o['page'] = Math.ceil((start+this.pageSize)/this.pageSize);
    if(this.fireEvent('beforechange', this, o) !== false){
      this.store.load({params:o});
    }
  }

});

Ext.reg('jcrudpagingtoolbar', JJWorks.JCrudPagingToolbar);

