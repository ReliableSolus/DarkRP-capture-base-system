net.Receive("RaidSystem_GetMessage", function()
    local msg = net.ReadString()
    chat.AddText(Color(199, 16, 16), "[Системное сообщение]", Color(255, 255, 255), msg)
end)
