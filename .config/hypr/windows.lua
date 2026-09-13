--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

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
    if (w.class == "org.mozilla.firefox" and not string.find(w.title, title)) then
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
        float = true
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
