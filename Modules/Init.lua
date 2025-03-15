local Init = {}

function Init.setup()
    local rs = game:GetService("RunService")
    local uis = game:GetService("UserInputService")
    local ss = game:GetService("SoundService")
    local cs = game:GetService("CollectionService")

    local fw = game:GetService("ReplicatedStorage").WeaponFrameworkRep

    local plr = game:GetService("Players").LocalPlayer
    local cam = workspace.CurrentCamera
    local mouse = plr:GetMouse()

    local dotTag

    local cameraEffect = script.Parent.CameraEffect
    local infraredEffect = script.Parent.InfraredEffect
    local nvEffect = script.Parent.NVEffect

    local gui = script.Parent.TargettingGui
    gui.Parent = plr.PlayerGui

    local nvgOn = false

    local cameraOn = false
    local cameraSet = false
    local infraredOn = false
    local lastNormalCF = cam.CFrame

    local locked = false
    local target
    local relativeCF

    local irSky = script.Parent.InfraredSky:Clone()
    local normalSky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")

    local cameraModel = script.Parent.Camera.Value
    local cameraFrom = cameraModel.Optics.CameraFrom

    local elevation = script.Parent.StartingAngle.Value.X
    local traverse = script.Parent.StartingAngle.Value.Y

    local variables = cameraModel.Settings

    local elevMult = (variables.InvertElevation.Value and -1 or 1)
    local travMult = (variables.InvertTraverse.Value and -1 or 1)

    local configuredIgnore = variables.RaycastIgnore.Value

    local seats = {}

    if configuredIgnore ~= nil then
        for _,v in pairs(configuredIgnore:GetDescendants()) do
            if v:IsA("Seat") or v:IsA("VehicleSeat") then
                table.insert(seats, v)
            end
        end
    end

    local step = 1
    local step2 = 1

    local clickSound = Instance.new("Sound")
    clickSound.Volume = 2
    clickSound.SoundId = "rbxassetid://410814187"

    local inputs = {
        {0, Enum.KeyCode.W, Enum.KeyCode.S},
        {0, Enum.KeyCode.D, Enum.KeyCode.A},
        {0, Enum.KeyCode.Q, Enum.KeyCode.E}
    }

    return {
        rs = rs,
        uis = uis,
        ss = ss,
        cs = cs,
        fw = fw,
        plr = plr,
        cam = cam,
        mouse = mouse,
        dotTag = dotTag,
        cameraEffect = cameraEffect,
        infraredEffect = infraredEffect,
        nvEffect = nvEffect,
        gui = gui,
        nvgOn = nvgOn,
        cameraOn = cameraOn,
        cameraSet = cameraSet,
        infraredOn = infraredOn,
        lastNormalCF = lastNormalCF,
        locked = locked,
        target = target,
        relativeCF = relativeCF,
        irSky = irSky,
        normalSky = normalSky,
        cameraModel = cameraModel,
        cameraFrom = cameraFrom,
        elevation = elevation,
        traverse = traverse,
        variables = variables,
        elevMult = elevMult,
        travMult = travMult,
        configuredIgnore = configuredIgnore,
        seats = seats,
        step = step,
        step2 = step2,
        clickSound = clickSound,
        inputs = inputs
    }
end

return Init
