-- Impostazione della variabile di rinculo massimo
local maxRecoil = 0.2 -- Modifica questo valore per aumentare o diminuire il rinculo massimo

-- Funzione per la riduzione del rinculo delle armi
local function onRecoil(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseMovement then -- Verifica se il mouse è in movimento
        input.UserInputDelta = input.UserInputDelta / (1 + maxRecoil) -- Riduce il rinculo in base alla variabile di rinculo massimo
    end
end

-- Aggiunta della funzione alla connessione di input
game:GetService("UserInputService").InputChanged:Connect(onRecoil)
