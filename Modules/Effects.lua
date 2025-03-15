local Effects = {}

function Effects.setNV(state, cameraOn, cam, fw)
    local nvgOn = state

    if cameraOn then state = false end

    if state == false then
        game.Lighting.Ambient = fw.LightingConditions.Ambient.Value
        game.Lighting.OutdoorAmbient = fw.LightingConditions.OutdoorAmbient.Value
        game.Lighting.Brightness = fw.LightingConditions.Brightness.Value
        game.Lighting.GlobalShadows = fw.LightingConditions.GlobalShadows.Value
    end

    return nvgOn
end

function Effects.updateNV(nvgOn, cam, nvEffect)
    nvEffect.Parent = (nvgOn and cam or script.Parent)

    if nvgOn then
        game.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        game.Lighting.Brightness = 3
        game.Lighting.GlobalShadows = false
    end
end

function Effects.setIR(state, cs, fw, formatCharIR, formatPartIR, setDots)
    local infraredOn = state

    for _,v in pairs(game.Players:GetPlayers()) do
        formatCharIR(v.Character, state)
    end

    for _,model in pairs(cs:GetTagged("RocketModel")) do
        for _,v in pairs(model:GetDescendants()) do
            if v:IsA("BasePart") then
                formatPartIR(v, state)
            end
        end
    end

    for _,model in pairs(cs:GetTagged("MissileModel")) do
        for _,v in pairs(model:GetDescendants()) do
            if v:IsA("BasePart") then
                formatPartIR(v, state)
            end
        end
    end

    setDots(state)

    if state == false then
        game.Lighting.Ambient = fw.LightingConditions.Ambient.Value
        game.Lighting.OutdoorAmbient = fw.LightingConditions.OutdoorAmbient.Value
        game.Lighting.Brightness = fw.LightingConditions.Brightness.Value
        game.Lighting.GlobalShadows = fw.LightingConditions.GlobalShadows.Value
    end

    return infraredOn
end

function Effects.updateIR(infraredOn)
    if infraredOn then
        game.Lighting.Ambient = Color3.fromRGB(100, 100, 100)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
        game.Lighting.Brightness = .5
        game.Lighting.GlobalShadows = false
    end
end

return Effects
