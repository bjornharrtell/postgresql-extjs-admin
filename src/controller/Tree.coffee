Ext.define 'PEA.controller.Tree',
    extend: 'Ext.app.Controller'
    stores: ['Tree']
    views: ['Tree']
    init: ->
        console.log('Initialized Users! This happens before the Application launch function is called');

