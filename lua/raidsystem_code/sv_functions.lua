util.AddNetworkString("RaidSystem_GetMessage")

function RaidSystem.SendMessage(activator, msg)
    net.Start("RaidSystem_GetMessage")
    net.WriteString(msg)
    net.Send(activator)
end

function RaidSystem.BroadCastMessage(msg)
    net.Start("RaidSystem_GetMessage")
    net.WriteString(msg)
    net.Broadcast()
end

