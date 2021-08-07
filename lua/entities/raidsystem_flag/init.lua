AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/FurnitureBoiler001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if (phys:IsValid()) then
        phys:Wake()
    end

    self:SetUseType(SIMPLE_USE)
end

function ENT:ClaimTerritory(ply)
    if not RaidSystem.RestrictedTeams[ply:Team()] then return "Вы не можете захватывать флаги." end
    if RaidSystem.RestrictedTeams[RaidSystem.GetTeamNumber(ply:Team())] == self:GetClaimedTeam() then return "Вы уже захватили этот флаг." end
    if self:GetState() == 1 then return "Захват флага уже идёт, ожидайте." end
    if timer.Exists(self:EntIndex() .. "_TryClaiming") then return self:GetTerritoryName() .. " не может быть захвачена, так как недавно была попытка захвата." end
    self:SetPlayerCL(ply)
    self:SetStartTime(CurTime())
    self:SetState(1)
    RaidSystem.BroadCastMessage("Начался захват территории " .. self:GetTerritoryName() .. ".")

    timer.Create(self:EntIndex() .. "_TryClaiming", 900, 1, function()
        RaidSystem.BroadCastMessage("Территория " .. self:GetTerritoryName() .. " снова доступна для захвата.")
    end)

    return "Вы начали захват территории " .. self:GetTerritoryName() .. "."
end

function ENT:EndClaim(claimed)
    self:SetState(0)
    if not RaidSystem.RestrictedTeams[self:GetPlayerCL():Team()] then return RaidSystem.SendMessage(self:GetPlayerCL(), "Ваша текущая профессия не может захватывать.") end

    if claimed then
        RaidSystem.BroadCastMessage("Территория " .. self:GetTerritoryName() .. " захвачена.")
        self:SetClaimedTeam(RaidSystem.GetTeamNumber(self:GetPlayerCL():Team()))
    else
        RaidSystem.BroadCastMessage("Захват территории " .. self:GetTerritoryName() .. " провалился.")
    end
end

function ENT:Think()
    self:NextThink(CurTime() + 1)
    if self:GetState() == 0 then return end
    if CurTime() - self:GetStartTime() > RaidSystem.CaptureTime then return self:EndClaim(true) end
    if not self:GetPlayerCL():Alive() or self:GetPlayerCL():GetPos():Distance(self:GetPos()) > 5000 then return self:EndClaim(false) end

    return true
end

function ENT:Use(activator)
    if not activator:IsPlayer() then return end
    local msg = self:ClaimTerritory(activator)

    if msg then
        RaidSystem.SendMessage(activator, msg)
    end
end

function ENT:OnRemove()
    timer.Remove(self:EntIndex() .. "_TryClaiming")
end