local GUIUpdates = {}

function GUIUpdates.updateUI(gui, cameraOn, nvgOn, infraredOn)
    gui.Interface.CameraPower.Text = "FLIR: " .. (cameraOn and "ON" or "OFF")
    gui.Interface.ExternalNVG.Text = "NVG: " .. (nvgOn and "ON" or "OFF")
    gui.Interface.InfraredToggle.Text = "IR: " .. (infraredOn and "ON" or "OFF")

    gui.Interface.InfraredToggle.Visible = cameraOn
    gui.Interface.ExternalNVG.Visible = not cameraOn
end

return GUIUpdates
