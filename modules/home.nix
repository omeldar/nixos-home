{
  config,
  pkgs,
  ...
}: {
  home-manager.users.akotami = {
    home.stateVersion = "24.11"; # Match your system's state version

    # Manage WezTerm Config here
    xdg.configFile."wezterm/wezterm.lua".text = ''
          local wezterm = require 'wezterm'  -- Required for WezTerm to work

          return {
			initial_rows = 23,
      		initial_cols = 100,

            -- Font with fallback options
            font = wezterm.font_with_fallback({
              "JetBrains Mono",        -- Primary font
              "Fira Code",             -- Fallback 1
              "Hack",                  -- Fallback 2
              "Noto Sans Mono",        -- Fallback 3
              "monospace",             -- Generic fallback
            }),
            font_size = 12.0,

            color_scheme = "Colorful Colors (terminal.sexy)",
            window_background_opacity = 1.0,
            text_background_opacity = 1.0,

            -- Background Image
            background = {
              {
                source = {
                  File = "/etc/nixos/media/EldenRing3.jpg",
                },
                opacity = 0.1,
              },
            },

            -- Hide tab bar when only one tab is open
      		enable_tab_bar = true,
            hide_tab_bar_if_only_one_tab = true,

            -- Hide scroll bar when nothing to scroll
            enable_scroll_bar = false,

            -- Cursor settings
            cursor_blink_rate = 800,
            cursor_thickness = "2px",

            -- Custom key bindings
            keys = {
              { key="/", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
              { key="-", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },
              { key="x", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}} },
            },
			
			mouse_bindings = {
			  {
				event = { Down = { streak = 1, button = "Right" } },
				mods = "NONE",
				action = wezterm.action.PasteFrom("Clipboard"),
			  },
			},

            -- Enable GPU Acceleration
            front_end = "WebGpu",
          }
    '';
  };
}
