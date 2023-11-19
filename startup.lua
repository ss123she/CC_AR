if fs.exists("/installer.lua") then
    fs.delete("/installer.lua")
end
shell.run("/base.lua")
