Ext.ns('JJWorks');

JJWorks.JWindow = Ext.extend(Ext.Window, {
  constructor: function (config) {
    // Aplica qualquer coisa especificada no objeto de configuração a esse objeto
    Ext.apply(this, config);

    Ext.apply(this, {
      height:580,
      width:800,
      left: 0,
      top: 0,
      font-size: 1,
      autoScroll:true,
      modal:true
    });

    JJWorks.JWindow.superclass.constructor.call(this);
  }
});

Ext.reg('jwindow', JJWorks.JWindow);

