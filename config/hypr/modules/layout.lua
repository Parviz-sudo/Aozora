-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    general = {
        layout = "dwindle"
    },

    dwindle = {
        preserve_split = true,

        -- specifies the scale factor of windows on the special workspace
        -- AKA extra gaps for special workspaces
        special_scale_factor = 0.95,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_on_top = true,
        new_status = "master",
        special_scale_factor = 0.95,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        explicit_column_widths = "0.5, 0.6, 0.9, 1.0",
        column_width = 0.6,

        -- when a window is focused, require that at least
        -- a given fraction of it is visible for focus to follow. [0.0 - 1.0]
        -- 1.0 -> follow only on hard input
        follow_min_visible = 1.0,

        -- When a column is focused, what method should be used to bring it into view.
        -- 0: center,
        -- 1: fit
        focus_fit_method = 0,

        -- When enabled, causes hl.dsp.layoutmsg("swapcol l/r") to wrap around at the beginning and end.
        wrap_swapcol = false,
    },
})
