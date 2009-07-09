Ext.ns('JJWorks');

JJWorks.JWindow = Ext.extend(Ext.Window, {
  constructor: function (config) {
    // Aplica qualquer coisa especificada no objeto de configuração a esse objeto
    Ext.apply(this, config);

    Ext.apply(this, {
      height:400,
      width:500,
      autoScroll:true,
      modal:true
    });

    JJWorks.JWindow.superclass.constructor.call(this);
  }
});

Ext.reg('jwindow', JJWorks.JWindow);

