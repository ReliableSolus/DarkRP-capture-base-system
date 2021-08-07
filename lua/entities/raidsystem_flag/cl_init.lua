include("shared.lua")

function ENT:Draw()
    self:DrawModel()
    local pos = self:GetPos() + Vector(0, 0, self:OBBMaxs().z)
    local ang = LocalPlayer():EyeAngles()
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), 90)
    cam.Start3D2D(pos, Angle(ang.x, ang.y, ang.z), 0.5)

    if self:GetState() ~= 0 then
        draw.DrawText("Территорию захватывает: " .. self:GetPlayerCL():Name(), "ScoreboardDefault", 5, -1, color_white, TEXT_ALIGN_LEFT)
    end

    draw.DrawText("Территория " .. self:GetTerritoryName(), "ScoreboardDefault", 10, -20, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText("Контролируется: " .. RaidSystem.TeamsNames[self:GetClaimedTeam()], "ScoreboardDefault", 10, -40, color_white, TEXT_ALIGN_LEFT)
    cam.End3D2D()
end