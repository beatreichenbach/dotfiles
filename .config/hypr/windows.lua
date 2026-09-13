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

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Noctalia
hl.window_rule({
    name = "noctalia-settings",
    match = {
        class = "dev.noctalia.noctalia-qs",
        title = "Noctalia",
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

hl.window_rule({
    name = "firefox-bitwarden",
    match = {
        class = "org.mozilla.firefox",
        title = "Bitwarden",
    },
    float = true,
})

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
        title = "^(win.*)",
    },
    float = true,
})

-- hl.window_rule({
--     name = "jetbrains-no-focus",
--     match = {
--         class = "^(jetbrains-.*)",
--     },
--     no_initial_focus = true,
-- })

hl.window_rule({
    name = "jetbrains-popups",
    match = {
        class = "^(jetbrains-.*)",
        title = "Rename"
    },
    stay_focused = true,
})

hl.window_rule({
    name = "python-float",
    match = {
        class = "python3|.*\\.py",
    },
    float = true,
})

-- Jetbrains
hl.window_rule({
    name = "houdini-launcher",
    match = {
        class = "houdini_launcher",
    },
    float = true,
    center = true
})
