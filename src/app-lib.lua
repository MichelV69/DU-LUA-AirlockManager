function statusLights(whichLights, whatAction)
    if string.lower(whichLights) == 'all'
        and string.lower(whatAction) == 'reset' then
        insideLight.deactivate()
        outsideLight.deactivate()
        insideLight.setColor(ws2_blue)
        outsideLight.setColor(ws2_blue)
        insideLight.activate()
        outsideLight.activate()
    end
end

function closeAllDoors()
    insideDoor.close()
    outsideDoor.close()
end

--- end of file ---
