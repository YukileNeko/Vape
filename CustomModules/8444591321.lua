local function vapeGithubRequest(scripturl)
    if not isfile(scripturl) then
        local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/YukileNeko/Vape/main/CustomModules"..scripturl, true) end)
        if not suc or res == "404: Not Found" then return nil end
        if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
        writefile(scripturl, res)
    end
    return readfile(scripturl)
end

shared.CustomSaveVape = 6872274481
if isfile("CustomModules/6872274481.lua") then
    loadstring(readfile("CustomModules/6872274481.lua"))()
else
    local publicrepo = vapeGithubRequest("CustomModules/6872274481.lua")
    if publicrepo then
        loadstring(publicrepo)()
    end
end
