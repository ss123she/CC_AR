if fs.exists("/ar-base.lua") then
    term.write("\nApplying an update...")
    os.sleep(1)
    term.write("\nDeleted old ar-base.lua...")
    fs.delete("/ar-base.lua")
    os.sleep(1)
end
if fs.exists("/startup.lua") then
    term.write("\nDeleted old startup.lua...")
    fs.delete("/startup.lua")
    os.sleep(1)
end
term.write("\nInstalling base.lua...")
os.sleep(1)
shell.run("wget https://raw.githubusercontent.com/ss123she/CC_AR/main/base.lua")
os.sleep(1)
shell.run("wget https://raw.githubusercontent.com/ss123she/CC_AR/main/startup.lua")
os.sleep(1)
term.write("\nRebooting...")
os.sleep(1)
term.write("progress: [███████----------]")
os.sleep(1)
term.write("progress: [█████████████----]")
os.sleep(1)
term.write("progress: [█████████████████]")
os.reboot()
