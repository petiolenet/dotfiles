-- petiole hyprland config
-- Everything lives in ./modules; order matters, later files win on conflicts.
-- The pre-split single file is kept as hyprland.lua.bak

require("modules.monitors")
require("modules.env")
require("modules.autostart")
require("modules.input")
require("modules.look")
require("modules.animations")
require("modules.layouts")
require("modules.binds")
require("modules.rules")
