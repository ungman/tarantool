return {
    up = function()
        local utils = require('migrator.utils')

        local users_table = box.schema.space.create("users_table", { if_not_exists = true })
            users_table:format({
                { name = "id", type = "uuid" },
                { name = "login", type = "string" },
                { name = "name", type = "string" },
                { name = "bucket_id", type = "unsigned" },
                { name = "post", type = "string" }
            })
            users_table:create_index("primary", { parts = { { field = "id" } }, if_not_exists = true })
            users_table:create_index("login", { parts = { { field = "login" } }, unique = true, if_not_exists = true })

            utils.register_sharding_key('users_table', { 'id' })

            return true
    end
}


