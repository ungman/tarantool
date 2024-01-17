return {
    up = function()
        local utils = require('migrator.utils')

        local users = box.schema.space.create("users", { if_not_exists = true })
            users:format({
                { name = "id", type = "uuid" },
                { name = "login", type = "string" },
                { name = "name", type = "string" },
                { name = "post", type = "string" },
                { name = "bucket_id", type = "unsigned" }
            })

             users:create_index("primary", { parts = { { field = "id" } },
                                            if_not_exists = true })
             users:create_index("bucket_id", { parts = { { field = "bucket_id" } },
                                              unique = false,
                                          if_not_exists = true })
            utils.register_sharding_key('users', { 'id' })

            return true
    end
}


