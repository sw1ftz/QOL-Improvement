local CameraControl = {}

function CameraControl.powerUp(cam, cameraModel, gui)
    local lastNormalCF = cam.CFrame

    cam.CameraType = Enum.CameraType.Scriptable
    cam.CFrame = cameraModel.Optics.InternalCamera.CFrame * CFrame.fromEulerAnglesYXZ(math.rad(-elevation), math.rad(-traverse), 0) * CFrame.new(0,0,-1.3)
    gui.Crosshair.Visible = true

    return lastNormalCF, true, false
end

function CameraControl.powerDown(cam, plr, lastNormalCF, gui)
    cam.CameraType = Enum.CameraType.Custom
    cam.CameraSubject = plr.Character.Humanoid
    cam.FieldOfView = 70
    cam.CFrame = lastNormalCF

    gui.Crosshair.Visible = false

    return false
end

function CameraControl.setCamera(state, cam, plr, cameraModel, gui, setNV, setIR)
    if state then
        return CameraControl.powerUp(cam, cameraModel, gui)
    else
        CameraControl.powerDown(cam, plr, lastNormalCF, gui)
        setIR(false)
        return false
    end
end

return CameraControl
