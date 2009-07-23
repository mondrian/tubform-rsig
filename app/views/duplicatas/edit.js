
var dbduplicatas = new Ext.data.Store({
    reader: new Ext.data.JsonReader({
        fields: ['id', 'plano_de_conta_id','tipo_cobranca','data_emissao', 'data_vencimento', 'valor', 'cliente_id', 'pedido_id', 'nome_devedor', 'devedor_id' ],
        root: 'duplicatas'
    }),
    proxy: new Ext.data.HttpProxy({
        url: 'duplicata/index.json'
    })
});

dbduplicatas.load();

var combo = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbduplicatas,
    displayField:'plano_de_conta_id',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Plano de Conta',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});

var combo = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbduplicatas,
    displayField:'cliente_id',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Cliente',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});

var combo = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbduplicatas,
    displayField:'pedido_id',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um Cliente',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});

var combo = new Ext.form.ComboBox({
    fieldLabel: 'Duplicata',
    store: dbduplicatas,
    displayField:'devedor_id',
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
    url:'/duplicatas/edit',
    frame:true,
    bodyStyle:'padding:5px 5px 0',
    defaults: {width: 230},
    defaultType: 'textfield',
    width:'auto',
    baseParams:{authenticity_token:"<%=form_authenticity_token%>"},
    items: [{
            fieldLabel: 'Plano de Contas',
            name: 'plano_de_conta_id',
        },{
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
        }, {
            fieldLabel: 'Cliente',
            name: 'ciente_id'
        }, {
            fieldLabel: 'Pedido',
            name: 'pedido_id'
        }, {
            fieldLabel: 'Nome do Devedor',
            name: 'nome_devedor'
        }, {
            fieldLabel: 'Devedor',
            name: 'devedor_id'
        }
        combo ],

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
