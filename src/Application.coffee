Ext.application
    requires: ['PEA.controller.Tree']
    name: 'PEA'
    appFolder: 'app'
    controllers: ['Tree']
    launch: ->
        Ext.create 'Ext.container.Viewport', 
            layout: 'fit'
            items:
                xtype: 'tree'
            

