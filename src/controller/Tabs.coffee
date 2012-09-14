ref = (ref) ->
    ref: ref
    selector: "##{ref}"

Ext.define 'PEA.controller.Tabs',
    extend: 'Ext.app.Controller'
    views: ['Tabs', 'Result']
    refs: [ref('resultgrid'), ref('sql')]
    init: ->
        @control
            '#run':
                click: @onRunClick
                
    onRunClick: ->
        Ext.Ajax.request
            url: 'http://localhost:3000/db/test'
            method: 'POST'
            scope: this
            jsonData: 
                sql: @getSql().getValue()
            success: @onSuccess
    
    onSuccess: (response) ->
        data = JSON.parse response.responseText
        fields = Object.keys data[0]
        columns = fields.map (field) ->
            text: field
            dataIndex: field
        store = Ext.create 'Ext.data.JsonStore',
            data: data
            fields: fields
        @getResultgrid().reconfigure store, columns
