local EventConnections = {}

function EventConnections.connectEvents(rs, uis, ss, clickSound, setCamera, setNV, setIR, lock, unlock, inputs)
    gui.Interface.CameraPower.MouseButton1Click:Connect(function()
        ss:PlayLocalSound(clickSound)
        setCamera(not cameraOn)
    end)

    gui.Interface.ExternalNVG.MouseButton1Click:Connect(function()
        ss:PlayLocalSound(clickSound)
        setNV(not nvgOn)
    end)

    gui.Interface.InfraredToggle.MouseButton1Click:Connect(function()
        ss:PlayLocalSound(clickSound)
        setIR(not infraredOn)
    end)

    uis.InputBegan:Connect(function(v, gpe)
        if not gpe then
            if v.KeyCode == Enum.KeyCode.R and cameraOn then
                if not locked then
                    lock()
                else
                    unlock()
                end
            elseif v.KeyCode == Enum.KeyCode.C then
                ss:PlayLocalSound(clickSound)
                setCamera(not cameraOn)
            elseif v.KeyCode == Enum.KeyCode.T and not cameraOn then
                ss:PlayLocalSound(clickSound)
                setNV(not nvgOn)
            elseif v.KeyCode == Enum.KeyCode.F and cameraOn then
                ss:PlayLocalSound(clickSound)
                setIR(not infraredOn)
            else
                for _,data in pairs(inputs) do
                    if v.KeyCode == data[2] then
                        data[1] = 1
                        break
                    elseif v.KeyCode == data[3] then
                        data[1] = -1
                        break
                    end
                end
            end
        end
    end)
end

return EventConnections
