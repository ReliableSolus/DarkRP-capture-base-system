AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/consolebox01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if (phys:IsValid()) then
        phys:Wake()
    end

    self:SetUseType(SIMPLE_USE)
    self.NextMoney = CurTime() + RaidSystem.TimeToAddMoney
    self:SetMoney(0)
end

function ENT:Think()
    self:NextThink(CurTime() + 1)
    if self.FlagEnt:GetClaimedTeam() == RaidSystem.PoliceTeamNumber or self.FlagEnt:GetClaimedTeam() == 1 then return end
    if self:GetMoney() > RaidSystem.MaxPrinterMoney then return end

    if CurTime() > self.NextMoney then
        self:SetMoney(self:GetMoney() + RaidSystem.MoneyAddWithPrint)
        self.NextMoney = CurTime() + RaidSystem.TimeToAddMoney
    end

    return true
end

function ENT:Use(activator)
    if not activator:IsPlayer() or not RaidSystem.RestrictedTeams[activator:Team()] then return end
    local amount = self:GetMoney()
    local team_number = RaidSystem.RestrictedTeams[RaidSystem.GetTeamNumber(activator:Team())]

    if RaidSystem.PoliceTeamNumber == team_number then
        self.FlagEnt:SetClaimedTeam(RaidSystem.PoliceTeamNumber)
    end

    if amount > 0 and self.FlagEnt:GetClaimedTeam() == team_number then
        activator:addMoney(amount)
        self:SetMoney(0)
        RaidSystem.SendMessage(activator, "Вы собрали " .. amount .. " рублей.")
    else
        RaidSystem.SendMessage(activator, "Вы не можете собрать деньги с этого автомата.")
    end
end