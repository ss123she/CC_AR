local http = require("socket.http")
local ltn12 = require("ltn12")
local lfs = require("lfs")

-- Замените эти значения на свои данные
local githubUsername = "ss123she"
local githubRepository = "CC_AR"
local fileName = "base.lua"
local localFilePath = fileName

-- Функция для загрузки содержимого файла с GitHub
function downloadFromGitHub(username, repository, file, outputFilePath)
    local url = string.format("https://raw.githubusercontent.com/%s/%s/main/%s", username, repository, file)
    local response = {}
    
    local success, status = http.request {
        url = url,
        sink = ltn12.sink.table(response)
    }
    
    if success and status == 200 then
        local fileContent = table.concat(response)
        local file = io.open(outputFilePath, "w")
        file:write(fileContent)
        file:close()
        print("File downloaded successfully.")
    else
        print("Failed to download file.")
    end
end

-- Функция для сравнения двух файлов
function compareFiles(localFile, githubFile)
    local localContent = assert(io.open(localFile)):read("*all")
    local githubContent = githubFile
    
    return localContent == githubContent
end

-- Проверяем, существует ли локальный файл
if lfs.attributes(localFilePath) then
    -- Загружаем содержимое файла с GitHub
    local githubContent = downloadFromGitHub(githubUsername, githubRepository, fileName)
    
    -- Сравниваем локальный и удаленный файлы
    if not compareFiles(localFilePath, githubContent) then
        print("Local and remote files are different. Updating...")
        downloadFromGitHub(githubUsername, githubRepository, fileName, localFilePath)
    else
        print("Local and remote files are the same. No update needed.")
    end
else
    print("Local file does not exist. Downloading from GitHub...")
    downloadFromGitHub(githubUsername, githubRepository, fileName, localFilePath)
end

if fs.exists("/installer.lua") then
    fs.delete("/installer.lua")
end
shell.run("/base.lua")
