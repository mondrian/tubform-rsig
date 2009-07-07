JJWorks.JStore = Ext.extend(Ext.data.Store, {
  constructor: function (config) {
    // Aplica qualquer coisa especificada no objeto de configuração a esse objeto
    Ext.apply(this, config);

    Ext.apply(this, {
      url: '/' + this.entities + '.json',
      reader: new Ext.data.JsonReader()
    });

    JJWorks.JStore.superclass.constructor.call(this);
  }
});

Ext.reg('jstore', JJWorks.JStore);

