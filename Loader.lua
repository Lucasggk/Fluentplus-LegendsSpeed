

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

main:AddToggle("so pra funfa", {
    Title = "",
    Description = "",
    Default = false,
    Callback = function(state)
      if (state) then
        print("oi")
      else
        print("oiii")
            end
        end
    })
