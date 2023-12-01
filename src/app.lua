function app()
    -- Here's to the crazy ones. The misfits. The rebels. The troublemakers.

    -- -- when Button is pressed, then start the Airlock cycle.
    farSet         = {}
    farSet.button  = outsideButton
    farSet.door    = outsideDoor
    farSet.light   = outsideLight
    farSet.buttonLight = outsideButtonLight

    nearSet        = {}
    nearSet.button = insideButton
    nearSet.door   = insideDoor
    nearSet.light  = insideLight


    if outsideButton.active() then
        farSet.button  = insideButton
        farSet.door    = insideDoor
        farSet.light   = insideLight
        nearSet.button = outsideButton
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
    -- -- -- set far door Button color (red)
    -- -- -- set near door Button color (blue)
    -- -- -- update screens with process status
    -- -- -- wait six seconds
    -- -- -- close near door
    -- -- -- set near door status light (red)
    -- -- -- set near door Button color (red)
    -- -- -- update screens with process status
    -- -- -- play airlock sound effect
    -- -- -- wait three seconds
    -- -- -- open far door
    -- -- -- set far door status light (yellow)
    -- -- -- update screens with process status
    -- -- -- wait six seconds
    -- -- -- close far door
    -- -- -- set near door status light (green)
    -- -- -- set near door Button color (green)
    -- -- -- set far door status light (green)
    -- -- -- set far door Button color (green)
    -- -- -- update screens with process status
    -- exit
end

--- end of file ---
