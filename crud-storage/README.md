### CRUD storage

1. install CRUD storage

    ```shell
    $ helm install crud helm-chart/ -f helm-chart/values.yaml
    ```

1. apply migrations via web ui

    ```lua
    return {
        up = function()
            local customers_space = box.schema.space.create('customers', {
                format = {
                    {name = 'id', type = 'unsigned'},
                    {name = 'bucket_id', type = 'unsigned'},
                    {name = 'name', type = 'string'},
                    {name = 'age', type = 'number'},
                },
                if_not_exists = true,
            })
            customers_space:create_index('id', {
                parts = { {field ='id', is_nullable = false} },
                if_not_exists = true,
            })
            customers_space:create_index('bucket_id', {
                parts = { {field ='bucket_id', is_nullable = false} },
                unique = false,
                if_not_exists = true,
            })
            customers_space:create_index('age', {
                parts = { {field ='age'} },
                unique = false,
                if_not_exists = true,
            })
            local utils = require('migrator.utils')
            utils.register_sharding_key('customers', {'bucket_id'})
            return true
        end
    }
    ```
