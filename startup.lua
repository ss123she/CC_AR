function wget(link)
    shell.run("wget " .. link)
end

function compareFiles(file1, file2)
    local content1 = assert(io.open(file1, "rb")):read("*all")
    local content2 = assert(io.open(file2, "rb")):read("*all")

    return content1 == content2
end
if fs.exists("/bin") then
    shell.run("cd /bin")
    if fs.exists("/bin/base.lua") then
        fs.remove("/bin/base.lua")
        term.write("deleted base.lua")
    end
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
    term.write("success added new base.lua")
    shell.run("cd /")
else
    shell.run("mkdir /bin")
    term.write("folder bin created")
    shell.run("cd /bin")
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
    term.write("success")
    shell.run("cd /")
end
file1 = "/bin/base.lua"
file2 = "/base.lua"
if compareFiles(file1, file2) then
    term.write("Files are the same.")
else
    print("Files are different, replacing")
    shell.run("cd /")
    wget("https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
end
if fs.exists("/installer.lua") then fs.remove("/installer.lua") end

term.execute("/base.lua")