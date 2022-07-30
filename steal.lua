local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mybanks = lib.Network.Invoke("get my banks")

local Exclusive_W_Bank = {}
local Wybrany_Bank = ""

for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Bank.Frame.Side.Holder:GetChildren()) do
    if v.Name ~= "UIListLayout" and v.Name ~= "_Banks" and v.Name ~= "_Invites" and  v.Name ~= "UIPadding" and  v.Name ~= "_div" and v.Name ~= "_NoInvites" then
        if v.Image == "rbxassetid://8121303915" then
            Wybrany_Bank = v.Name
        end
    end
end

for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Bank.Frame.Container.Bank.Pets:GetChildren()) do
    if v.Name ~= "UIPadding" and v.Name ~= "UIGridLayout" then
        if v.RarityGradient:FindFirstChild("Exclusive") then
           table.insert(Exclusive_W_Bank, v.Name)
        end
    end
end

local ohTable1 = {
    [1] = Wybrany_Bank,
    [2] = Exclusive_W_Bank,
    [3] = 0
}
workspace.__THINGS.__REMOTES["bank withdraw"]:InvokeServer(ohTable1)

wait(8)

local ohTable1 = {
    [1] = mybanks[1]['BUID'],
    [2] = Exclusive_W_Bank,
    [3] = 0
}
workspace.__THINGS.__REMOTES["bank deposit"]:InvokeServer(ohTable1)

Exclusive_W_Bank = {}
