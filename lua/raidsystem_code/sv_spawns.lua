function SpawnBaseItems()
    for Id, Territory in ipairs(RaidSystem.Spawns) do
        local FlagEnt = ents.Create("raidsystem_flag")
        FlagEnt:SetPos(Vector(Territory.FlagSpawnPos[1][1]))
        FlagEnt:SetAngles(Angle(Territory.FlagSpawnPos[1][2]))
        FlagEnt:SetTerritoryName(Territory.Nameof)
        FlagEnt:SetClaimedTeam(1)
        FlagEnt:Spawn()

        for _, Position in ipairs(Territory.MoneyPrinterPos) do
            local MoneyPrinter = ents.Create("raidsystem_moneyprinter")
            MoneyPrinter:SetPos(Vector(Position[1]))
            MoneyPrinter:SetAngles(Angle(Position[2]))
            MoneyPrinter.FlagEnt = FlagEnt
            MoneyPrinter:Spawn()
        end
    end
end

hook.Add("PostCleanupMap", "RaidSystem_RespawnEnts", SpawnBaseItems)