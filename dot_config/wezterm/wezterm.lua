local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 20.0,
	default_cursor_style = "SteadyBar",
	macos_window_background_blur = 30,

	window_decorations = "RESIZE",
	window_background_opacity = 0.8,

	keys = {
		{
			key = "o",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				print("Ctrl + O pressed")
				pane:send_text("\n")
			end),
		},
	},

	-- make Zen Mode work
	wezterm.on("user-var-changed", function(window, pane, name, value)
		local overrides = window:get_config_overrides() or {}
		if name == "ZEN_MODE" then
			local incremental = value:find("+")
			local number_value = tonumber(value)
			if incremental ~= nil then
				while number_value > 0 do
					window:perform_action(wezterm.action.IncreaseFontSize, pane)
					number_value = number_value - 1
				end
				overrides.enable_tab_bar = false
			elseif number_value < 0 then
				window:perform_action(wezterm.action.ResetFontSize, pane)
				overrides.font_size = nil
				overrides.enable_tab_bar = true
			else
				overrides.font_size = number_value
				overrides.enable_tab_bar = false
			end
		end
		window:set_config_overrides(overrides)
	end),
}
