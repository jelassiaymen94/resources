local debugmode = require 'shared.config'.DebugMode
---@param text string | table
---@param title? string
local function DebugCon(text, title)
    if debugmode then
        if type(text) == "table" then
            local data = {
                title = title,
                data = text
            }
            print(title, json.encode(data, { indent = true, pretty = true }))
        else
            print(text)
        end
    end
end

return {
    DebugCon = DebugCon
}
