JJWorks.JGrid = Ext.extend(Ext.grid.GridPanel, {
  constructor: function (config) {
    // Aplica qualquer coisa especificada no objeto de configuração a esse objeto
    Ext.apply(this, config);
    Ext.apply(this, {
      viewConfig: {
        forceFit: true
      },
      sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
      height: 340,
      width: 800,
      iconCls: 'icon-grid',
      autoShow: true
    });

    this.loadStore();
    this.loadBar();

    JJWorks.JGrid.superclass.constructor.call(this);

  },

  loadStore: function(){
    this.store = new JJWorks.JStore({
      entities: this.entities
    });
    this.store.load({params:{start: 0, limit: 5, page:1}});
  },

  loadBar: function() {
    this.bbar = new JJWorks.JCrudPagingToolbar({
      store: this.store,
      entity: this.entity,
      entities: this.entities
    });
  },

  onRender: function() {
    JJWorks.JGrid.superclass.onRender.apply(this, arguments);
  }

});

Ext.reg('jgrid', JJWorks.JGrid);

