Ext.BLANK_IMAGE_URL = 'javascripts/ext/resources/images/default/s.gif';
Ext.ns('JJWorks');
Ext.Ajax.method = 'GET';

JJWorks.App = function(){

  return {

    init: function() {

      var westPanel = new Ext.Panel({
        region:'west',
        id:'painel-oeste',
        title:'Menu',
        split:true,
        width:170,
        minSize: 170,
        maxSize: 400,
        collapsible:true,
        margins:'0 0 0 5',
        layout:'accordion',
        layoutConfig:{animate:true},
        items:
           [
            { contentEl:'menu-cadastros', collapsed:true, title:'Cadastros Básicos', border:false, iconCls:'cadastros' },
            { contentEl:'menu-vendas', collapsed:true, title:'Vendas', border:false, iconCls:'vendas' }
           ]
      });

      var centerPanel = new Ext.TabPanel({
        region:'center',
        id:'centro',
        deferredRender:false,
        activeTab:0,
        items:[{
          id:'dashboard',
          contentEl:'centro1',
          title: 'Principal',
          closable:false,
          autoScroll:true
        }]
      });

      var viewport = new Ext.Viewport({
        layout:'border',
        items:[
          westPanel,
          centerPanel
        ]
      });

      menus = Ext.query('.link-menu');

      Ext.each(menus, function(menu,i){
        Ext.fly(menu).on('click', function(e){

          var tabPanel = viewport.getComponent("centro");
          var existingTab = tabPanel.getComponent(menu.id);
          var url = '/' + menu.id + '.js'

          if (!existingTab) {
            var panel = new Ext.Panel({
              id: menu.id,
              title: menu.innerHTML,
              closable: true,
              autoLoad: {
                scripts: true,
                url: url
              }
            });
            tabPanel.add(panel);
            tabPanel.doLayout();
            tabPanel.setActiveTab(panel);
          } else {
            tabPanel.setActiveTab(existingTab);
            existingTab.getUpdater().refresh();
          }

        });
      });

    }

  };

}();

Ext.onReady(function(){

  Ext.QuickTips.init();
  JJWorks.App.init();

});

