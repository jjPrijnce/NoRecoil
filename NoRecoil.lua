function removeRecoil()
    local currentWeapon = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    if currentWeapon then
        local fire = currentWeapon:FindFirstChild("Fire")
        if fire then
            fire.Recoil = 0
        end
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            removeRecoil()
        end
    end)
end)

removeRecoil()
