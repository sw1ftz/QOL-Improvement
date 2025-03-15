local TargetLocking = {}

function TargetLocking.lock(cf, cameraModel, findPart, fw)
    if cf == nil then
        cf = cameraModel.Optics.InternalCamera.CFrame * CFrame.fromEulerAnglesYXZ(math.rad(-elevation), math.rad(-traverse), 0) * CFrame.new(0,0,-1.3)
    end

    local hit, relative = findPart(cf, 105000)

    if hit ~= nil then
        local dotTag = math.random()

        fw.Events.LaserDot:FireServer(19742, "new", dotTag, hit, relative)

        return true, hit, relative, dotTag
    end

    return false
end

function TargetLocking.unlock(fw, dotTag)
    fw.Events.LaserDot:FireServer(19742, "end", dotTag)
    return false, nil, nil
end

return TargetLocking
