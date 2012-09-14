Ext.define 'PEA.view.Tabs',
    extend: 'Ext.tab.Panel'
    alias: 'widget.tabs'
    tabBar: 
        border: 0
        plain: true
    initComponent: ->
        center =
            region: 'center'
            xtype: 'textareafield'
            minHeight: 150
            itemId: 'sql'
            fieldStyle: 'border: none;'
        south =
            height: 150
            border: false
            region: 'south'
            xtype: 'result'
            split: true
    
        @items = [
            title: 'New query'
            layout: 'border'
            tbar: ['-',
                icon: 'resources/icons/control.png'            
                itemId: 'run'
            ]
            items: [center, south]  
        ]
    
        @callParent arguments 
    
