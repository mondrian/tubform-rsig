Ext.onReady(function(){
  Ext.QuickTips.init();
  Ext.Ajax.method = 'GET';
  var viewport = new Ext.Viewport({
    layout:'border',
    items:[
      {
      region:'west', id:'painel-oeste', title:'Menu', split:true, width:170,minSize: 170, maxSize: 400,
      collapsible:true, margins:'0 0 0 0', layout:'accordion', layoutConfig:{animate:true},
      items:
       [
        {contentEl:'menu-cadastros',collapsed:true, title:'Cadastros', border:false, iconCls:'cadastros'},
        {contentEl:'menu-vendas',collapsed:true, title:'Vendas', border:false, iconCls:'cadastros'},
        {contentEl:'menu-estoque',collapsed:true, title:'Estoque', border:false, iconCls:'cadastros'},
        {contentEl:'menu-financeiro',collapsed:true, title:'Financeiro', border:false, iconCls:'cadastros'}
       ]
      },
      new Ext.TabPanel({
        id:'centro', region:'center', deferredRender:false, activeTab:0,
        items:[{id:'dashboard',contentEl:'centro1',title: 'Principal',closable:false,autoScroll:true}]
      })
    ]
  });



    
  Ext.get('opcao-pedidos_venda').on('click', function(e){
    var tabs = viewport.getComponent("centro");
    var destroyed = tabs.getComponent("pedidos_venda");
    if(destroyed == undefined) {
      console.log(destroyed);
      var panel = new Ext.Panel({
        id:'pedidos_venda',
        title:'Pedidos de Venda',
        closable:true,
        listeners: {
          activate: function(tab){
            tab.getUpdater().refresh();
          }
        },
        autoLoad:{
        scripts: true,
        url:'/pedidos'
        }
      });
      tabs.add(panel).show();
    } else {
      console.log(destroyed);
      destroyed.getUpdater().refresh();
    }
    tabs.add(panel).show();
  });

  Ext.get('opcao-pedido_assist').on('click', function(e){
    var tabs = viewport.getComponent("centro");
    var destroyed = tabs.getComponent("pedido_assist");
    if(destroyed == undefined) {
      console.log(destroyed);
      var panel = new Ext.Panel({
        id:'pedidos_assist',
        title:'Pedidos de Assistência',
        closable:true,
        listeners: {
          activate: function(tab){
            tab.getUpdater().refresh();
          }
        },
        autoLoad:{
        scripts: true,
        url:'/assistencia'
        }
      });
      tabs.add(panel).show();
    } else {
      console.log(destroyed);
      destroyed.getUpdater().refresh();
    }
    tabs.add(panel).show();
  });

  Ext.get('opcao-nota_fiscal').on('click', function(e){
    var tabs = viewport.getComponent("centro");
    var destroyed = tabs.getComponent("nota_fiscal");
    if(destroyed == undefined) {
      console.log(destroyed);
      var panel = new Ext.Panel({
        id:'nota_fiscal',
        title:'Notas Fiscais',
        closable:true,
        listeners: {
          activate: function(tab){
            tab.getUpdater().refresh();
          }
        },
        autoLoad:{
        scripts: true,
        url:'/notas_fiscais'
        }
      });
      tabs.add(panel).show();
    } else {
      console.log(destroyed);
      destroyed.getUpdater().refresh();
    }
    tabs.add(panel).show();
  });


});