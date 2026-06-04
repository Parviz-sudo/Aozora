-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- Tokyo Night color palette
local bg     = "0xff1a1b26"
local bg_alt = "0xff222330"
local fg     = "0xffc0caf5"
local blue   = "0xff7aa2f7"
local purple = "0xffbb9af7"
local cyan   = "0xff7dcfff"
local red    = "0xfff7768e"
local green  = "0xff9ece6a"
local yellow = "0xffe0af68"
local gray   = "0xff565f89"

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = blue,
            inactive_border = gray,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding       = 13,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.85,

        shadow = {
            enabled      = true,
            range        = 30,
            render_power = 4,
        },

        blur = {
            enabled   = true,
            size      = 7,
            passes    = 3,
            vibrancy  = 0.2,
            new_optimizations = true,
            ignore_opacity = false,
        },
        -- Dim
        dim_inactive = false,
        dim_strength = 0.12,
        dim_special = 0.2
    },

    animations = {
        enabled = true
    },
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false
        -- precise_mouse_move = true,
    },
})
-- ======================= Curves =======================
hl.curve("md3_decel",     { type = "bezier", points = { {0.05, 0.70}, {0.05, 1.00} } })
hl.curve("md3_accel",     { type = "bezier", points = { {0.30, 0.00}, {0.80, 0.15} } })
hl.curve("menu_decel",    { type = "bezier", points = { {0.10, 1.00}, {0.00, 1.00} } })
hl.curve("menu_accel",    { type = "bezier", points = { {0.52, 0.03}, {0.72, 0.08} } })
hl.curve("windMove",      { type = "bezier", points = { {0.83, 0.00}, {0.17, 1.00} } })
hl.curve("standardDecel", { type = "bezier", points = { {0.00, 0.00}, {0.00, 1.00} } })
hl.curve("emphasizedDecel", { type = "bezier", points = { {0.05, 0.70}, {0.10, 1.00} } })

-- ======================= Animations =======================
-- Window open (soft scale-in)
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3.0,
    bezier = "emphasizedDecel",
    style = "popin 80%"
})
-- Window close
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2.0,
    bezier = "menu_decel",
    style = "popin 90%"
})
-- Window movement (dragging / tiling)
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3.0,
    bezier = "emphasizedDecel",
    style = "slide"
})

-- Global fades
hl.animation({ leaf = "fade",       enabled = true, speed = 3.0, bezier = "md3_decel" })
hl.animation({ leaf = "fadeIn",     enabled = true, speed = 3.0, bezier = "md3_decel" })
hl.animation({ leaf = "fadeOut",    enabled = true, speed = 2.0, bezier = "md3_decel" })

-- Layers (Wofi, SwayNC, etc.)
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 2.4,
    bezier = "menu_decel",
    style = "popin 93%"
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "menu_accel",
    style = "popin 94%"
})
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 2.0, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "menu_accel" })

-- Workspaces
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4.0,
    bezier = "windMove",
    style = "slidevert"
})

-- Special workspace
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 3.0,
    bezier = "md3_decel",
    style = "slidefadevert 15%"
})

-- Border color transitions
hl.animation({ leaf = "border",    enabled = true, speed = 10, bezier = "md3_decel" })

-- Zoom (fullscreen, maximize)
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 3.0, bezier = "standardDecel" })

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        repeat_delay = 250,
        repeat_rate = 35,

        follow_mouse = 1,
        off_window_axis_events = 2,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.7
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = false,
        swallow_regex = "(foot|kitty|allacritty|Alacritty)",
        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = true,
        session_lock_xray = true,
        initial_workspace_tracking = false,
        focus_on_activate = true
    },

    binds = {
        scroll_event_delay = 0,
        hide_special_on_workspace_change = true
    },

    cursor = {
        zoom_factor = 1,
        zoom_rigid = false,
        zoom_disable_aa = true,
        hotspot_padding = 1
    },

    xwayland = {
        force_zero_scaling = true
    }
})
