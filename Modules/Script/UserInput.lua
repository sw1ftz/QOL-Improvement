local UserInput = {}

function UserInput.updateInputs(inputs, uis)
    for _,data in pairs(inputs) do
        if data[1] == 1 and not uis:IsKeyDown(data[2]) then
            data[1] = 0
        elseif data[1] == -1 and not uis:IsKeyDown(data[3]) then
            data[1] = 0
        end
    end
end

return UserInput
