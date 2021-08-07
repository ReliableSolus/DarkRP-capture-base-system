ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Денежный принтер"
ENT.Author = "Solus"
ENT.Spawnable = true
ENT.Category = "RaidSystem"

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Money")
end