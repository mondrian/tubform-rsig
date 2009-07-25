JJWorks.Store = Ext.extend(Ext.data.Store, {

  constructor: function(config) {

    Ext.apply(this, config);

    Ext.apply(this, {
      url: '/' + this.entityPlural + '.json',
      reader: new Ext.data.JsonReader()
    });

    JJWorks.Store.superclass.constructor.call(this);
  }

});

Ext.reg('jstore', JJWorks.Store);

