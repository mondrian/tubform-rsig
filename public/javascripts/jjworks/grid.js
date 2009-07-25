JJWorks.Grid = Ext.extend(Ext.grid.GridPanel, {

  constructor: function(config) {

    Ext.apply(this, config);

    Ext.apply(this, {
      viewConfig: {forceFit: true},
      sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
      height: 340,
      width: 800,
      iconCls: 'icon-grid',
      autoShow: true,
      plugins: [new Ext.ux.grid.Search({
        iconCls: 'icon-zoom',
        readonlyIndexes: ['note'],
        disableIndexes: ['pctChange'],
        minChars: 3,
        autoFocus: true
      })]
    });

    this.loadStore();
    this.loadBar();

    JJWorks.Grid.superclass.constructor.call(this);

  },

  loadStore: function() {
    this.store = new JJWorks.Store({
      entityPlural: this.entityPlural
    });
    this.store.load({params:{start:0, limit:30, page:1}});
  },

  loadBar: function(){
    this.bbar = new JJWorks.CRUDBar({
      store: this.store,
      entitySingular: this.entitySingular,
      entityPlural: this.entityPlural
    });
  },

  onRender: function(){
    JJWorks.Grid.superclass.onRender.apply(this, arguments);
  }

});

Ext.reg('jgrid', JJWorks.Grid);

