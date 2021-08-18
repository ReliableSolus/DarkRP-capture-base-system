--[[
    Location of territories.
    Use the tool to create a ready-made config.

    [Required fields]
    Nameof, FlagSpawnPos

    MoneyPrinterModule:
    MoneyPrinterPos
]]
RaidSystem.Spawns = {
    [1] = {
        Nameof = "Элитный район",
        FlagSpawnPos = {Vector(-1267.182495, -371.690186, -80.389969), Angle(-1262, -335, -79)},
        MoneyPrinterPos = {
            {Vector(-1267.182495, -371.690186, -80.389969), Angle(-1262, -335, -79)},
            {Vector(-1267.182495, -371.690186, -80.389969), Angle(-1262, -335, -79)},
            {Vector(-1262, -335, -79), Angle(-1262, -335, -79)}
        }
    },
    [2] = {
        Nameof = "Тестовая территория",
        FlagSpawnPos = {Vector(-1267.182495, -351.690186, -80.389969), Angle(-1262, -335, -79)},
        MoneyPrinterPos = {
            {Vector(-1267.182495, -371.690186, -80.389969), Angle(-1262, -335, -79)},
            {Vector(-1267.182495, -371.690186, -80.389969), Angle(-1262, -335, -79)},
            {Vector(-1262, -335, -79), Angle(-1262, -335, -79)}
        }
    },
}

-- Time to take over the territory.
RaidSystem.CaptureTime = 120