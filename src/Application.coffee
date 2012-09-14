Ext.application
    requires: ['PEA.controller.Tree']
    name: 'PEA'
    appFolder: 'app'
    controllers: ['Tree', 'Tabs']
    launch: ->
        west = 
            xtype: 'tree'
            region: 'west'
            split: true
            width: 200
        center = 
            xtype: 'tabs'
            region: 'center'
    
        Ext.create 'Ext.container.Viewport', 
            layout: 'border'
            border: false
            padding: '5 5 5 5'
            items: [west, center]
                
            

