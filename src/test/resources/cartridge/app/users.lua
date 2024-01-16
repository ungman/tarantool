local crud = require('crud')

local function find_user_by_login(login)
    local user, err = crud.select("users", { { '=', 'login', login } })
    if err ~= nil then
        return nil, err
    end

    return user
end

return find_user_by_login
