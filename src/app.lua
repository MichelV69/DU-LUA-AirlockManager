function app()
    -- Here's to the crazy ones. The misfits. The rebels. The troublemakers.

    -- -- when Switch is pressed, then start the Airlock cycle.
    -- if BOTH Switches are active, reset and ignore
    farSet         = {}
    farSet.switch  = outsideSwitch
    farSet.door    = outsideDoor
    farSet.light   = outsideLight
    farSet.buttonLight = outsideSwitchLight
    farSet.directionText = "Outside"

    nearSet        = {}
    nearSet.switch = insideSwitch
    nearSet.door   = insideDoor
    nearSet.light  = insideLight
    nearSet.buttonLight = insideSwitchLight


    if outsideSwitch.active() then
        farSet.switch  = insideSwitch
        farSet.door    = insideDoor
        farSet.light   = insideLight
        farSet.buttonLight = insideSwitchLight
        farSet.directionText = "Inside"

        nearSet.switch = outsideSwitch
        nearSet.door   = outsideDoor
        nearSet.light  = outsideLight
        nearSet.buttonLight = outsideSwitchLight
    end

    -- -- -- ensure far door closed
    farSet.door.close()
    -- -- -- open near door
    nearSet.door.open()
    -- -- -- set far door status light (red)
    farSet.light.setColor(red)
    -- -- -- set near door status light (green)
    nearSet.light.setColor(green)
    -- -- -- update screens with process status
    screenProcessStatus("Please enter airlock. Starting Cycle.")

    -- -- -- wait six seconds
    -- ??? a miracle happens here ??? --

    -- -- -- close near door
    nearSet.door.close()
    -- -- -- set near door status light (red)
    nearSet.light.setColor(red)
    -- -- -- set near door Switch color (red)
    farSet.light.setColor(red)
    -- -- -- update screens with process status
    screenProcessStatus("Please wait. Preparing to open " .. farSet.directionText ..
" door.")
    -- -- -- play airlock sound effect
    system.playSound(airlockSound)

    -- -- -- wait three seconds
    -- ??? a miracle happens here ??? --

    -- -- -- open far door
    farSet.door.open()
    -- -- -- set far door status light (yellow)
    farSet.buttonLight(yellow)
    -- -- -- update screens with process status
    screenProcessStatus("Please exit the airlock. Cycle completed.")

    -- -- -- wait six seconds
    -- ??? a miracle happens here ??? --

    -- -- -- close far door
    farSet.door.close()
    -- -- -- set near door status light (green)
    nearSet.light.setColor(green)
    -- -- -- set near door Switch color (green)
    nearSet.buttonLight.setColor(green)
    -- -- -- set far door status light (green)
    farSet.light.setColor(green)
    -- -- -- set far door Switch color (green)
    farSet.buttonLight.setColor(green)
    -- -- -- update screens with process status
    screenProcessStatus("Airlock is idle and available. Press button to start Cycle.")
    -- exit
    unit.exit()
end

--- end of file ---
