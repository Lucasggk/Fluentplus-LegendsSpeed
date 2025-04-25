local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 

local Window = Fluent:CreateWindow({
    Title = "Legends of Speed",
    SubTitle = "Feito por Lucas",
    TabWidth = 160,
    Size = UDim2.fromOffset(540, 400),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})

local main = Window:AddTab({ Title = "main", Icon = "home" })

local section1 = main:AddSection("Delays do farm")

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
    Min = 0.01,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        xpDelay = value
    end
})

main:AddSlider("so pra funfa", {
    Title = "orb Delay",
    Default = 0.25,
    Min = 0.01,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        orbDelay = value
    end
})

main:AddSlider("so pra funfa", {
    Title = "gem Delay",
    Default = 0.25,
    Min = 0.01,
    Max = 0.5,
    Rounding = 2,
    Callback = function(value)
        gemDelay = value
    end
})



local section2 = main:AddSection("Onde você está farmando?")

local Cidade = "City"

local Dropdown = main:AddDropdown("CidadeFarm", {
    Title = "Selecione a Cidade", 
    Values = {"City", "Snow City", "Magma City", "Legends Highway"},
    Multi = false,
    Default = "City"
})

Dropdown:OnChanged(function(value)
    Cidade = value
    print("Cidade selecionada:", Cidade)
end)

main:AddParagraph({
    Title = "Obrigatório por a cidade de farm!"
})

local section3 = main:AddSection("Toggles do Farm")

local farming1 = false
local farming2 = false
local farming3 = false
local farming4 = false

main:AddToggle("FarmXP", {
    Title = "farm orb XP",
    Description = "Farma orb de XP",
    Default = false,
    Callback = function(state)
        farming1 = state
        if farming1 then
            task.spawn(function()
                while farming1 do
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

main:AddToggle("FarmNormal", {
    Title = "farm orb",
    Description = "Farma orb normal",
    Default = false,
    Callback = function(state)
        farming2 = state
        if farming2 then
            task.spawn(function()
                while farming2 do
                    local args = {
                        [1] = "collectOrb",
                        [2] = "Ethereal Orb",
                        [3] = Cidade
                    }
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                    task.wait(orbDelay)
                end
            end)
        end
    end
})

main:AddToggle("FarmGem", {
    Title = "farm gem orb",
    Description = "Farma gem orb",
    Default = false,
    Callback = function(state)
        farming3 = state
        if farming3 then
            task.spawn(function()
                while farming3 do
                    local args = {
                        [1] = "collectOrb",
                        [2] = "Infernal Gem",
                        [3] = Cidade
                    }
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                    task.wait(gemDelay)
                end
            end)
        end
    end
})

main:AddToggle("AutoRebirth", {
    Title = "auto rebirth",
    Description = "Dá rebirth automaticamente",
    Default = false,
    Callback = function(state)
        farming4 = state
        if farming4 then
            task.spawn(function()
                while farming4 do
                    local args = {
                        [1] = "rebirthRequest"
                    }
                    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
                    task.wait(1)
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
    Title = "Área City",
    Description = "Vai para a área City, No Req",
    Callback = function()
        task.wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.6768, 4.1268, 439.5089)
    end
})

tps:AddButton({
    Title = "Área Snow",
    Description = "Vai para a área Snow, Req lv 25",
    Callback = function()
        local args = {
            [1] = "travelToArea",
            [2] = workspace.areaCircles.areaCircle
        }
        game:GetService("ReplicatedStorage").rEvents.areaTravelRemote:InvokeServer(unpack(args))
        task.wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9673.832, 59.3068, 3769.7688)
    end
})

tps:AddButton({
    Title = "Área Magma",
    Description = "Vai para a área Magma, Req 1 rebirth",
    Callback = function()
        local args = {
            [1] = "travelToArea",
            [2] = workspace.areaCircles.areaCircle
        }
        game:GetService("ReplicatedStorage").rEvents.areaTravelRemote:InvokeServer(unpack(args))
        task.wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11055.4072, 217.2668, 4903.2363)
    end
})

tps:AddButton({
    Title = "Área Legends Highway",
    Description = "Vai para a área Legends Highway, Req 10 rebirths",
    Callback = function()
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13098.3134765625, 217.26686096191406, 5906.0810546875)
    end
})










local gfarm = Window:AddTab{
    Title = "GodFarm",
    Icon = "list"
}

local section = gfarm:AddSection("aviso:")

gfarm:AddParagraph{
    Title = "Como usar?",
    TextSize = 7,
    Content = "Causa ping alto (20-100k), não trava, só dá delay."
}


gfarm:AddParagraph{
    Title = " ",
    TextSize = 15,
    Content = "O local farm tem que estar selecionado no Dropdown!"
}

local section = gfarm:AddSection("selecione a cidade do farming:")

local Dropdown = gfarm:AddDropdown("CidadeFarm", {
    Title = "Selecione a Cidade", 
    Values = {"City", "Snow City", "Magma City", "Legends Highway"},
    Multi = false,
    Default = "City"
})

Dropdown:OnChanged(function(value)
    Cidade2 = value
    print("Cidade selecionada:", Cidade2)
end)


local section = gfarm:AddSection("mini regras:")

gfarm:AddParagraph({
        Title = "como usar:",
        Content = "clicar 1 por vez e nao clique muito, demora um pouco para cair tudo"
    })

gfarm:AddParagraph({
        Title = "",
        Content = "Para farm level Gfarmsp (muito mais rapido)"
    })

local section = gfarm:AddSection("Gfarms button:")

if false then gfarm:AddButton({
    Title = "GfarmXP (God Farm XP)",
    Description = "Use o Dropdown para marcar Cidade atual de farm. Não spame click, causará muito lag.",
    Callback = function()
        for i = 1, 100000 do
            local args = {
                [1] = "collectOrb",
                [2] = "Yellow Orb",
                [3] = Cidade2
            }
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
        end
    end
})
end 

gfarm:AddButton({
    Title = "GfarmSP (God Farm XP e Speed)",
    Description = "Use o Dropdown para marcar Cidade atual de farm. Não spame click, causará muito lag.",
    Callback = function()
        for i = 1, 10000 do
            local args = {
                [1] = "collectOrb",
                [2] = "Ethereal Orb",
                [3] = Cidade2
            }
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
        end
    end
})

gfarm:AddButton({
    Title = "GfarmGem (God Farm Gem)",
    Description = "Use o Dropdown para marcar Cidade atual de farm. Não spame click, causará muito lag.",
    Callback = function()
        for i = 1, 10000 do
            local args = {
                [1] = "collectOrb",
                [2] = "Infernal Gem",
                [3] = Cidade2
            }
            game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
        end
    end
})
