hl.bind(
  "SUPER + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind("ALT + Space", hl.dsp.exec_cmd("~/.config/rofi/scripts/launcher_t2"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("CTRL + ALT + Q", hl.dsp.exec_raw("hyprlock & sleep 1 && hyprctl dispatch 'hl.dsp.dpms({ action = \"off\" })'"))
