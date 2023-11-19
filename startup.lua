function wget(link)
    shell.run("wget " .. link)
end

function compareFiles(file1, file2)
    local content1 = assert(io.open(file1, "rb")):read("*all")
    local content2 = assert(io.open(file2, "rb")):read("*all")

    return content1 == content2
end

if fs.exists("/bin") then
    shell.setWorkingDirectory("/bin")
    if fs.exists("/bin/base.lua") then
        fs.remove("/bin/base.lua")
        term.write("deleted base.lua\n")
    end
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
    term.write("success added new base.lua\n")
    shell.setWorkingDirectory("/")
else
    shell.run("mkdir /bin")
    term.write("folder bin created\n")
    shell.setWorkingDirectory("/bin")
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
    term.write("success\n")
    shell.setWorkingDirectory("/")
end

local file1 = "/bin/base.lua"
local file2 = "/base.lua"
if compareFiles(file1, file2) then
    term.write("Files are the same.\n")
else
    print("Files are different, replacing")
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
end

if fs.exists("/installer.lua") then
    fs.remove("/installer.lua")
end

dofile("/base.lua")