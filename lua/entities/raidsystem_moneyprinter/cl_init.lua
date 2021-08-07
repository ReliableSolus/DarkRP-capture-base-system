include("shared.lua")

function ENT:Draw()
    self:DrawModel()
    local pos = self:GetPos() + Vector(0,0,self:OBBMaxs().z + 25)
    local ang = LocalPlayer():EyeAngles()
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), 90)
    cam.Start3D2D(pos, Angle(ang.x, ang.y, ang.z), 0.3)
    draw.DrawText("Денежный принтер принадлежит: " .. self:GetFlagEnt():GetTerritoryName(), "ScoreboardDefault", 10, -20, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText("Денег сейчас: " .. self:GetMoney(), "ScoreboardDefault", 0, 0, color_white, TEXT_ALIGN_LEFT)
    cam.End3D2D()
end