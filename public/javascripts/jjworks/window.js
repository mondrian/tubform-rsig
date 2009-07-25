JJWorks.Window = Ext.extend(Ext.Window, {
  constructor: function (config) {
    Ext.apply(this, config);

    Ext.apply(this, {
      height:530,
      width: 825,
      autoScroll:true,
      modal:true
    });

    JJWorks.Window.superclass.constructor.call(this);

  }
});

Ext.reg('jwindow', JJWorks.Window);

