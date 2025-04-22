

local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 

local Window = Fluent:CreateWindow({
    Title = "Legends of Speed",
    SubTitle = "Feito por Lucas",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})


local main = Window:AddTab({
    Title = "main",
    Icon = "home"
  })

main:AddParagraph({
        Title = "delay do farm",
        Description = "para nao causar lag você decide o delay"
    })

Delay = 0.25

main:AddSlider("so pra funfa", {
    Title = "Delay",
    Default = 0.25,
    Min = 0.05,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        local Delay = value
    end
})

        

main:AddToggle("so pra funfa", {
    Title = "farm orb XP",
    Description = "Farma orb de XP",
    Default = false,
    Callback = function(state)
    farming = state
    if farming then
        task.spawn(function()
            while farming do
                print("oi, tempo para próxima palavra: " .. Delay)
                task.wait(Delay)
            end
        end)
    end
    })
