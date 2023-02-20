local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- imposto il rinculo dell'arma a zero
local function NoRecoil()
    for _,v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            local tool = require(v)
            tool.Recoil = 0
        end
    end
end

-- imposto la velocità di fuoco dell'arma al 10% in più
local function FasterShooting()
    for _,v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            local tool = require(v)
            tool.AutoFire = true
            tool.FireRate = tool.FireRate * 0.9
        end
    end
end

-- notifica quando lo script funziona
local function Notify()
    local NotificationBindable = Instance.new("BindableEvent")
    NotificationBindable.Event:Connect(function()
        print("Script attivato!")
    end)
    NotificationBindable:Fire()
end

NoRecoil()
FasterShooting()
Notify()

-- aspetto che il giocatore spari per ripristinare le impostazioni di default
Mouse.Button1Down:Connect(function()
    for _,v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            local tool = require(v)
            tool.Recoil = 1
            tool.AutoFire = false
            tool.FireRate = tool.FireRate / 0.9
        end
    end
end)
