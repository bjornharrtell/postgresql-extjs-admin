Ext.define 'PEA.store.Tree',
    extend: 'Ext.data.TreeStore'
    
    proxy:
        type: 'rest'
        url: 'http://localhost:3000'
    root:
        text: 'PostgreSQL'
        id: 'db'
        icon: 'resources/icons/databases.png'
        expanded: true
        
    constructor: (config) ->
        this.callParent arguments
        
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
        
        Ext.override @getProxy(),
            processResponse: (success, operation, request, response, callback, scope) ->
                url = parseURL request.url
                path = url.path.substring 1
                
                texts =
                    'schemas': 'Schemas'
                    'tables': 'Tables'
                
                icons = 
                    'db': 'databases',
                    'databases': 'database',
                    'schemas': 'blueprint',
                    'tables': 'table'
                    
                makeIconPath = (type, text) ->
                    if icons[type]
                        "resources/icons/#{icons[type]}.png"
                    else if text is 'schemas'
                        "resources/icons/blueprints.png"
                    else if text is 'tables'
                        "resources/icons/tables.png"
                    else
                        undefined
                
                data = JSON.parse response.responseText
                children = if data.type == 'table' then false else true
                leaf = if data.type == 'tables' then true else false
                if children
                    data.children = data.children.map (child) ->
                        text: texts[child] || child
                        leaf: leaf
                        icon: makeIconPath(data.type, child)
                        id: "#{path}/#{child}"
                response.responseText = JSON.stringify data
                
                this.callParent arguments

