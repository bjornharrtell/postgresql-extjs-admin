parseURL = (url) ->
    a =  document.createElement('a')
    a.href = url
    ret =
        source: url
        protocol: a.protocol.replace(':','')
        host: a.hostname
        port: a.port
        query: a.search
        hash: a.hash.replace('#','')
        path: a.pathname.replace(/^([^\/])/,'/$1')
        segments: a.pathname.replace(/^\//,'').split('/')

Ext.onReady ->
    Ext.QuickTips.init()
    
    store = Ext.create 'Ext.data.TreeStore',
        proxy:
            type: 'rest',
            url: 'http://localhost:3000'
        root:
            text: 'PostgreSQL'
            id: 'db'
            expanded: true

    reader = store.getProxy().getReader()

    Ext.override store.getProxy(),
        processResponse: (success, operation, request, response, callback, scope) ->
            
            url = parseURL request.url
            path = url.path.substring 1
            
            data = JSON.parse response.responseText
            children = if data.type == 'table' then false else true
            leaf = if data.type == 'tables' then true else false
            if children
                data.children = data.children.map (e) ->
                    text: e
                    leaf: leaf
                    id: "#{path}/#{e}"
            response.responseText = JSON.stringify data
            
            this.callParent arguments

    tree = Ext.create 'Ext.tree.Panel',
        border: false
        store: store
    
    viewport = Ext.create 'Ext.Viewport',
        layout: 'fit'
        border: false
        items: tree
        
