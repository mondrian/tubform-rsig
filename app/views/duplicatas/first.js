/*
 * The original ExtJs example of a simple form, coded in javascript inside
 * a .js rwt view.
 *
 */
var clientes = new Ext.data.SimpleStore({
    fields: ['id', 'nome'],
    data : [['1','luiz'],['2','magno'],['3','batista']]
});

var dbclientes = new Ext.data.Store({
    reader: new Ext.data.JsonReader({
        fields: ['id', 'razao_social'],
        root: 'cliente'
    }),
    proxy: new Ext.data.HttpProxy({
        url: 'test/index.json'
    })
});

dbclientes.load();

var combo = new Ext.form.ComboBox({
    fieldLabel: 'Cliente',
    store: dbclientes,
    displayField:'razao_social',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione um cliente',
    selectOnFocus:true,
    autoCreate: true,
    autoShow: true
});


var simple = new Ext.FormPanel({
    labelWidth: 75, /* label settings here cascade unless overridden */
    url:'/contacts_rwt/create',
    frame:true,
    bodyStyle:'padding:5px 5px 0',
    defaults: {width: 230},
    defaultType: 'textfield',
    width:'auto',
    baseParams:{authenticity_token:"<%=form_authenticity_token%>"},
    items: [{
            fieldLabel: 'First Name',
            name: 'first',
            allowBlank:false
        },{
            fieldLabel: 'Last Name',
            name: 'last'
        },{
            fieldLabel: 'Company',
            name: 'company'
        }, {
            fieldLabel: 'Email',
            name: 'contact[email]',
            vtype:'email'
        }, 
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
