
local key = script_key
local version = getgenv().NebulaVersion

if not key then
    warn("No Luarmor key found")
    return
end

getgenv().script_key = key

local gameId = game.GameId

print("[NebulaLoader] GameId:", gameId)
print("[NebulaLoader] Version:", version)

local loaderUrl

if gameId == 10769552054 then
    loaderUrl = "https://api.luarmor.net/files/v4/loaders/f6d03af5ffebfa6c62e244bdeb26f40b.lua"

elseif version == "Lite" then
    loaderUrl = "https://api.luarmor.net/files/v4/loaders/c8a1070ff0cf39d90eb9fc25d88397fc.lua"

elseif version == "Full" then
    loaderUrl = "https://api.luarmor.net/files/v4/loaders/cf62c75f9d9512152bac397773b324ce.lua"

elseif version == "Legacy" then
    loaderUrl = "https://api.luarmor.net/files/v4/loaders/f500de13b89126dc0c850851958b8690.lua"

else
    warn("[NebulaLoader] Invalid version:", tostring(version))
    return
end

print("[NebulaLoader] Loading selected loader...")

local success, result = pcall(function()
    local source = game:HttpGet(loaderUrl)
    local fn = loadstring(source)

    if not fn then
        error("Failed to compile loader")
    end

    fn()
end)

if not success then
    warn("[NebulaLoader] Error:", result)
end
