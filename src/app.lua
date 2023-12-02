function app()
    -- Here's to the crazy ones. The misfits. The rebels. The troublemakers.

    -- -- when Switch is pressed, then start the Airlock cycle.
    -- if BOTH Switches are active, reset and ignore

    farSet         = {}
    farSet.switch  = outsideSwitch
    farSet.door    = outsideDoor
    farSet.light   = outsideLight
    farSet.buttonLight = outsideSwitchLight

    nearSet        = {}
    nearSet.switch = insideSwitch
    nearSet.door   = insideDoor
    nearSet.light  = insideLight

    if outsideSwitch.active() then
        farSet.switch  = insideSwitch
        farSet.door    = insideDoor
        farSet.light   = insideLight
        nearSet.switch = outsideSwitch
        nearSet.door   = outsideDoor
        nearSet.light  = outsideLight
    end
    -- -- -- ensure far door closed
    farSet.door.close()
    -- -- -- open near door
    nearSet.door.open()
    -- -- -- set far door status light (red)
    farSet.light.setColor(red)
    -- -- -- set near door status light (green)
    nearSet.light.setColor(green)
    -- -- -- set far door Switch color (red)
    -- -- -- set near door Switch color (blue)
    -- -- -- update screens with process status
    -- -- -- wait six seconds
    -- -- -- close near door
    -- -- -- set near door status light (red)
    -- -- -- set near door Switch color (red)
    -- -- -- update screens with process status
    -- -- -- play airlock sound effect
    -- -- -- wait three seconds
    -- -- -- open far door
    -- -- -- set far door status light (yellow)
    -- -- -- update screens with process status
    -- -- -- wait six seconds
    -- -- -- close far door
    -- -- -- set near door status light (green)
    -- -- -- set near door Switch color (green)
    -- -- -- set far door status light (green)
    -- -- -- set far door Switch color (green)
    -- -- -- update screens with process status
    -- exit
end

--- end of file ---
