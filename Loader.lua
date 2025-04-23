

local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 

local Window = Fluent:CreateWindow({
    Title = "Legends of Speed",
    SubTitle = "Feito por Lucas",
    TabWidth = 160,
    Size = UDim2.fromOffset(540, 360),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})


local main = Window:AddTab({
    Title = "main",
    Icon = "home"
  })

local section = main:AddSection("Delays do farm")

main:AddParagraph({
        Title = "delay do farm",
        Description = "para nao causar lag você decide o delay"
    })

xpDelay = 0.25
orbDelay = 0.25
gemDelay = 0.25

main:AddSlider("so pra funfa", {
    Title = "xp Delay",
    Default = 0.25,
    Min = 0.05,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        local xpDelay = value
    end
})

main:AddSlider("so pra funfa", {
    Title = "orb Delay",
    Default = 0.25,
    Min = 0.05,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        local orbDelay = value
    end
})

main:AddSlider("so pra funfa", {
    Title = "gem Delay",
    Default = 0.25,
    Min = 0.05,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        local gemDelay = value
    end
})

local section = main:AddSection("onde você esta farmando?")

local Dropdown = main:AddDropdown("Dropdown", {
    Title = "Selecione a Cidade (obrigatorio)",
    Values = {"Snow City", "City"},
    Multi = false,
    Default = "City",
})

local Cidade = Dropdown.Value

Dropdown:OnChanged(function(value)
    Cidade = value
    print("Cidade selecionada:", Cidade)
end)




local section = main:AddSection("toggle do farm")
        

main:AddToggle("so pra funfa", {
    Title = "farm orb XP",
    Description = "Farma orb de XP",
    Default = false,
    Callback = function(state)
    farming = state
    if farming then
        task.spawn(function()
            while farming do

local args = {
    [1] = "collectOrb",
    [2] = "Yellow Orb",
    [3] = Cidade
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))

                            
                task.wait(xpDelay)
            end
        end)
    end
        end
    })





main:AddToggle("so pra funfa", {
    Title = "farm orb ",
    Description = "Farma orb normal ",
    Default = false,
    Callback = function(state)
    farming = state
    if farming then
        task.spawn(function()
            while farming do

local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = Cidade
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))

                            
                task.wait(orbDelay)
            end
        end)
    end
        end
    })


main:AddToggle("so pra funfa", {
    Title = "farm gem orb ",
    Description = "Farma gem orb ",
    Default = false,
    Callback = function(state)
    farming = state
    if farming then
        task.spawn(function()
            while farming do

local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = Cidade
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))

                            
                task.wait(gemDelay)
            end
        end)
    end
        end
    })











local tps = Window:AddTab({
        Title = "Teleports",
        Icon = "list"
    })

tps:AddButton({
        Title = "área congelada",
        Description = "vai para a área congelada, req lv 25", 
        Callback = function()
            local args = {
    [1] = "travelToArea",
    [2] = workspace.areaCircles.areaCircle
}

game:GetService("ReplicatedStorage").rEvents.areaTravelRemote:InvokeServer(unpack(args))

repeat.task(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9673.83203125, 59.306854248046875, 3769.768798828125
            end 
        end
    })
