-- Subconfigs
require("~/.config/hypr/subconfs/env.lua")
require("~/.config/hypr/subconfs/looknfeel.lua")
require("~/.config/hypr/subconfs/window.lua")
require("~/.config/hypr/subconfs/misc.lua")

require("~/.config/hypr/bindings/apps.lua")
require("~/.config/hypr/bindings/tiling.lua")
require("~/.config/hypr/bindings/media.lua")

-- Monitor
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Autostart
hl.on("hyprland.start", function () 
  hl.exec_cmd("hypridle & hyprpaper & waybar")
  hl.exec_cmd("swayosd-server")
  hl.exec_cmd("kime")
end)
