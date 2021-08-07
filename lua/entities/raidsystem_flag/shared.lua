ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Флаг для захвата"
ENT.Author = "Solus"
ENT.Instructions = "Флаг для захвата территорий, спавнить нужно через файл конфигурации."
ENT.Spawnable = true
ENT.Category = "RaidSystem"

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "PlayerCL")
    self:NetworkVar("Int", 0, "ClaimedTeam")
    self:NetworkVar("Int", 1, "State")
    self:NetworkVar("String", 0, "TerritoryName")
    self:NetworkVar("Float", 0, "StartTime")
end