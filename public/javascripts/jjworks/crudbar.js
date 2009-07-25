JJWorks.CRUDBar = Ext.extend(Ext.PagingToolbar, {

  constructor: function(config) {

    Ext.apply(this, config);

    Ext.apply(this, {
      pageSize:5,
      displayInfo: true,
      items: [
        '-',
        {
          text: 'Novo',
          entitySingular: this.entitySingular,
          entityPlural: this.entityPlural,
          handler: function(button) {
            JJWorks.CRUDActions.add(button.entitySingular, button.entityPlural);
          }
        },
        {
          text: 'Alterar',
          entitySingular: this.entitySingular,
          entityPlural: this.entityPlural,
          handler: function(button) {
            JJWorks.CRUDActions.edit(button.entitySingular, button.entityPlural);
          }
        },
        {
          text: 'Excluir',
          entitySingular: this.entitySingular,
          entityPlural: this.entityPlural,
          handler: function(button) {
            JJWorks.CRUDActions.remove(button.entitySingular, button.entityPlural);
          }
        }
      ]
    });

    JJWorks.CRUDBar.superclass.constructor.call(this);
  },

  doLoad : function(start){
    var options = {}, params = this.paramNames;
    options[params.start] = start;
    options[params.limit] = this.pageSize;
    options['page'] = Math.ceil((start+this.pageSize)/this.pageSize);
    if (this.fireEvent('beforechange', this, options) !== false) {
      this.store.load({params:options});
    }
  },

});

Ext.reg('jcrudbar', JJWorks.CRUDBar);

