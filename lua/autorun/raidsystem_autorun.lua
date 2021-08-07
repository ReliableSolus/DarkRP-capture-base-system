if RaidSystem then return end
RaidSystem = {}

local function AddFile(File, dir)
    local fileSide = string.lower(string.Left(File, 3))

    if SERVER and fileSide == "sv_" then
        include(dir .. File)
        print("[RaidSystem] SV INCLUDE: " .. File)
    elseif fileSide == "sh_" then
        if SERVER then
            AddCSLuaFile(dir .. File)
            print("[RaidSystem] SH ADDCS: " .. File)
        end

        include(dir .. File)
        print("[RaidSystem] SH INCLUDE: " .. File)
    elseif fileSide == "cl_" then
        if SERVER then
            AddCSLuaFile(dir .. File)
            print("[RaidSystem] CL ADDCS: " .. File)
        elseif CLIENT then
            include(dir .. File)
            print("[RaidSystem] CL INCLUDE: " .. File)
        end
    end
end

local function IncludeDir(dir)
    dir = dir .. "/"
    local File, Directory = file.Find(dir .. "*", "LUA")

    for k, v in ipairs(File) do
        if string.EndsWith(v, ".lua") then
            AddFile(v, dir)
        end
    end

    for k, v in ipairs(Directory) do
        print("[RaidSystem] Directory: " .. v)
        IncludeDir(dir .. v)
    end
end

hook.Add("postLoadCustomDarkRPItems", "RaidSystem_Load", function()
    IncludeDir("raidsystem_config")
    IncludeDir("raidsystem_code")
    IncludeDir("raidsystem_modules")
    timer.Simple(5, SpawnBaseItems)
end)