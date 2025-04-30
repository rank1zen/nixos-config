{ config
, pkgs
, ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Ctrl+F" = {
      action = maximize-column;
    };

    "Mod+C" = {
      action = center-column;
    };

    "Mod+Ctrl+T" = {
      action = toggle-column-tabbed-display;
    };

    "Mod+Ctrl+V" = {
      action = toggle-window-floating;
    };

    "Mod+H" = {
      action = focus-column-left;
    };

    "Mod+L" = {
      action = focus-column-right;
    };

    "Mod+Shift+H" = {
      action = move-column-left;
    };

    "Mod+Shift+L" = {
      action = move-column-right;
    };

    "Mod+D" = {
      action = spawn "fuzzel";
    };

    "Mod+T" = {
      action = spawn "sh" "-c" ''foot -D $XDG_DESKTOP_DIR'';
      hotkey-overlay.title = "Spawn foot";
    };

    "Mod+X" = {
      action = spawn "nautilus";
    };

    "Mod+P" = {
      action = spawn "sh" "-c" ''
        choice=$(fd -e pdf --color=never . $XDG_DESKTOP_DIR $XDG_DOWNLOAD_DIR | fuzzel -d)
        if [ "$choice" ]; then
          xdg-open "$choice"
        fi
      '';
      hotkey-overlay.hidden = true;
    };

    "Mod+Ctrl+Q" = {
      action = quit;
    };

    "Mod+Ctrl+Shift+Slash" = {
      action = show-hotkey-overlay;
    };

    "Mod+Ctrl+W" = {
      action = close-window;
    };

    "Mod+Ctrl+Minus" = {
      action = set-column-width "-10%";
    };

    "Mod+Ctrl+Equal" = {
      action = set-column-width "+10%";
    };

    "Mod+Ctrl+0" = {
      action = set-column-width "40%";
    };

    "XF86AudioRaiseVolume" = {
      action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
      allow-when-locked = true;
    };

    "XF86AudioLowerVolume" = {
      action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
      allow-when-locked = true;
    };

    "XF86AudioMute" = {
      action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      allow-when-locked = true;
    };

    "XF86AudioMicMute" = {
      action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      allow-when-locked = true;
    };

    "Print" = {
      action = screenshot;
    };

    "Alt+Print" = {
      action = screenshot-window;
    };

    "Mod+Tab" = {
      action = focus-window-down-or-top;
    };

    "Mod+Shift+Tab" = {
      action = focus-window-up-or-bottom;
    };
  };
}
