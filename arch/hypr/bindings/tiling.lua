-- Control window
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- Switch between last window
hl.bind("SUPER + TAB", hl.dsp.focus({ last = true}))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move active window around current workspace
local move_window = function(dir, pix)
  local lut = {l = {-1, 0}, r = {1, 0}, u = {0, -1}, d = {0, 1}}
  lut.left, lut.right, lut.up, lut.down = lut.l, lut.r, lut.u, lut.d
  local m = lut[dir]
  return function()
    local args =
    hl.get_active_window().floating and {x = m[1] * pix, y = m[2] * pix, relative = true} or {direction = dir}
    hl.dispatch(hl.dsp.window.move(args))
  end
end

hl.bind("SUPER + SHIFT + h", move_window("l", 30), { repeating = true })
hl.bind("SUPER + SHIFT + l", move_window("r", 30), { repeating = true })
hl.bind("SUPER + SHIFT + k", move_window("u", 30), { repeating = true })
hl.bind("SUPER + SHIFT + j", move_window("d", 30), { repeating = true })

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
