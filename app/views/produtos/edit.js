var pnl_produto = new Ext.FormPanel({
    labelWidth: 75, /* label settings here cascade unless overridden */
    url:'/produtos/update',
    frame:true,
    bodyStyle:'padding:5px 5px 0',
    defaults: {width: 230},
    defaultType: 'textfield',
    width:'auto',
    baseParams:{authenticity_token:"<%=form_authenticity_token%>"},
    items: [{
            fieldLabel: 'Descrição',
            name: 'descricao',
            allowBlank:false
        },{
            fieldLabel: 'Valor Normal',
            name: 'valor_normal'
        },{
            fieldLabel: 'Valor Especial',
            name: 'valor_especial'
        }],

    buttons: [{
        text: 'Salvar',
        tooltip: 'Save data',
        handler: function(){simple.form.submit()}
    },{
        text: 'Cancelar',
        tooltip: 'Cancel',
        handler: function(){win.close()}
    }]
});



var win=new Ext.Window({
                x:80,
                title:'Alteração de Prduto',
                width:400,
                y:80,
                height:210,
                items:[pnl_produto]
    });



win.show();
