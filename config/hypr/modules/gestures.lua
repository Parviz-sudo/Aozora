-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

-- 3-finger horizontal swipe → switch workspace (left/right)
hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace",
    scale = 0.8
})

-- 3-finger vertical swipe → scroll move (move active window)
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "scroll_move",
    scale = 0.8
})

-- 4-finger horizontal swipe → move window to next monitor (custom function)
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = function()
    hl.dispatch(hl.dsp.window.moveToMonitor({ direction = "next" }))
    end,
    scale = 1.0
})

-- Fullscreen on/off with 4-finger pinch (same as before)
hl.gesture({
    fingers = 4,
    direction = "pinchout",
    action = function()
    hl.dispatch(hl.dsp.window.fullscreen({ action = "set" }))
    end
})

hl.gesture({
    fingers = 4,
    direction = "pinchin",
    action = function()
    hl.dispatch(hl.dsp.window.fullscreen({ action = "unset" }))
    end
})
