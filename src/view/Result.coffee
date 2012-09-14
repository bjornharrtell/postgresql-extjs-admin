Ext.define 'PEA.view.Result',
    extend: 'Ext.tab.Panel'
    alias: 'widget.result'
    tabBar: 
        plain: true
    initComponent: ->

        @items = [{
            title: 'Data Output'
            border: false
            itemId: 'resultgrid'
            xtype: 'grid'
            columns: []
        }, {
            title: 'Messages'
            border: false
        }]
    
        @callParent arguments 
    
