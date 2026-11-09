--------------------------------
---- WORKSPACES ----
--------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Workspace 9: Recording
hl.workspace_rule({
    workspace   = "9",
    gaps_out    = { top = 0, right = 1280, bottom = 0, left = 1280 },
    float_gaps  = 0,
    border_size = 0,
})

-- Hide the Noctalia bar and its wallpaper
local wallpaperToggle = "$XDG_CONFIG_HOME/hypr/wallpaper-enabled.sh"
local recording = false

local function set_recording_mode(on, force)
    if on == recording and not force then return end
    recording = on
    hl.exec_cmd("noctalia msg " .. (on and "bar-hide" or "bar-show") .. " default")
    hl.exec_cmd(wallpaperToggle .. " " .. tostring(not on))
    hl.exec_cmd("noctalia msg config-reload")
end

hl.on("workspace.active", function(ws)
    if not ws then return end
    set_recording_mode(ws.id == 9)
end)

hl.on("hyprland.start", function()
    hl.timer(function()
        local ws = hl.get_active_workspace()
        set_recording_mode(ws ~= nil and ws.id == 9, true)
    end, { timeout = 2, type = "oneshot" })
end)

--------------------------------
---- WINDOWS ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- Noctalia
hl.window_rule({
    name = "noctalia-settings",
    match = {
        class = "dev.noctalia.Noctalia",
        title = "Noctalia Settings",
    },
    float = true,
})

-- Firefox
hl.window_rule({
    name = "firefox-pip",
    match = {
        class = "org.mozilla.firefox",
        title = "Picture-in-Picture",
    },
    float = true,
    pin = true,
})

hl.on("window.title", function(w)
    if not hl.get_active_monitor() then return end
    local title = "Bitwarden Password Manager"
    if (w.class == "org.mozilla.firefox" and string.find(w.title, title)) then
        hl.dispatch(
            hl.dsp.window.float({
                action = "enable",
                window = w
            })
        )
        hl.dispatch(
            hl.dsp.window.resize({
                x = 500,
                y = 600,
                relative = false,
                window = w
            })
        )
    end
end)

-- Discord
hl.window_rule({
    name = "discord-pip",
    match = {
        class = "discord",
        title = "Discord Popout",
    },
    float = true,
    pin = true,
})

-- Disable middle mouse clicks
hl.bind("mouse:274", function()
    local window = hl.get_active_window()
    if window ~= nil and string.match(window.class, "discord") then
        hl.dispatch(hl.dsp.exec_cmd("wl-copy -p -c"))
    else
        hl.dispatch(hl.dsp.pass({ window = window }))
    end
end)


-- OBS
hl.window_rule({
    name = "obs",
    match = {
        class = "com.obsproject.Studio",
    },
    float = true,
    pin = true,
})

-- Jetbrains
hl.window_rule({
    name = "jetbrains-float",
    match = {
        class = "^(jetbrains-.*)",
	title = "^$|Rename",
        float = true,
    },
    stay_focused = true
})

hl.window_rule({
    name = "python-float",
    match = {
        class = "python3|.*\\.py",
    },
    float = true,
})

-- Houdini
hl.window_rule({
    name = "houdini-launcher",
    match = {
        class = "houdini_launcher",
    },
    float = true,
    center = true
})

-- Anyware Client
hl.window_rule({
    name = "anyware-client",
    match = {
        class = "pcoip-client",
    },
    workspace = 2,
    center = true
})
