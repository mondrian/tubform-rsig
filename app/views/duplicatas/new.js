
var dbplano_de_conta_id = new Ext.data.Store({
    reader: new Ext.data.JsonReader({
        fields: ['id', 'plano_de_conta_id'],
        root: 'duplicatas'
    }),
    proxy: new Ext.data.HttpProxy({
        url: 'duplicata/index.json'
    })
});

var combo_plano_de_conta = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbduplicatas,
    displayField:'Plano de Conta',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Plano de Conta',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});

var dbcliente = new Ext.data.Store({
    reader: new Ext.data.JsonReader({
        fields: ['id', 'razao_social'],
        root: 'clientes'
    }),
    proxy: new Ext.data.HttpProxy({
        url: 'clientes/index.json'
    })
});

var combo_cliente = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbcliente,
    displayField:'Cliente',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Cliente',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});


var dbdevedor = new Ext.data.Store({
    reader: new Ext.data.JsonReader({
        fields: ['id', 'nome'],
        root: 'devedors'
    }),
    proxy: new Ext.data.HttpProxy({
        url: 'devedors/index.json'
    })
});

var combo_devedor = new Ext.form.ComboBox({
    fieldLabel: 'Devedor',
    store: dbdevedor,
    displayField:'Devedor',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Devedor',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});

var simple = new Ext.FormPanel({
    labelWidth: 75, /* label settings here cascade unless overridden */
    url:'/duplicatas/new',
    frame:true,
    bodyStyle:'padding:5px 5px 0',
    defaults: {width: 230},
    defaultType: 'textfield',
    width:'auto',
    baseParams:{authenticity_token:"<%=form_authenticity_token%>"},
    items: [combo_plano_de_conta,
      {
            fieldLabel: 'Pedido',
            name: 'pedido_id'
        }         
       {
            fieldLabel: 'Tipo de Cobrança',
            name: 'tipo_cobranca'
        },{
            fieldLabel: 'Data de Emissão',
            name: 'data_emissao'
        }, {
            fieldLabel: 'Data de Vencimento',
            name: 'data_vencimento'
        }, {
            fieldLabel: 'Valor',
            name: 'valor'
        }, 
             new Ext.form.DateField({
             fieldLabel: 'Time',
             name: 'time'}),

            combo_cliente,  
            combo_devedor],

    buttons: [{
        text: 'Save',
        tooltip: 'Save data',
        handler: function(){simple.form.submit()}
    },{
        text: 'Cancel',
        tooltip: 'Cancel',
        handler: function(){win.close()}
    }]
});


var win=new Ext.Window({
                x:80,
                title:'Simple Form - plain ExtJs javascript code',
                width:400,
                y:80,
                height:210,
                items:[simple]
    });



win.show();
