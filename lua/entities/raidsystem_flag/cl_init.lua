include("shared.lua")

function ENT:Draw()
    self:DrawModel()
    if self:GetPos():Distance(LocalPlayer():GetPos()) > 100 then return end
    local pos = self:GetPos()
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), -90)
    cam.Start3D2D(pos + Vector(0, 0, 15), Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.07)
    draw.SimpleTextOutlined("Контролируется: " .. RaidSystem.TeamsNames[self:GetClaimedTeam()], "raid_font50", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
    draw.SimpleTextOutlined("Территория " .. self:GetTerritoryName(), "raid_font50", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
    cam.End3D2D()
end