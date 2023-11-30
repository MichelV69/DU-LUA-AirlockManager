-- Here's to the crazy ones. The misfits. The rebels. The troublemakers.

-- The code below is just a "Hello World" that dumps the current links and their element classes
system.print('Debugging Control Unit...')
for linkName, element in pairs(library.getLinks()) do
  system.print(string.format('Found link `%s` of type `%s`', linkName, element.getClass()))
end

-- Stops execution
unit.exit()--- Airlock Controller

-- Sanity Check
local bootErrors = 0
if not outsideSwitch then bootErrors = bootErrors+1 end
if not insideSwitch then bootErrors = bootErrors+1 end

if not outsideDoor then bootErrors = bootErrors+1 end
if not  insideDoor then bootErrors = bootErrors+1 end

if bootErrors then
    system.print(" >> Boot Error.  Missing Crucial Equipment.")
    unit.exit()
    end

-- check switches
-- -- if both switches on, turn them both off, reset status lights, close all doors, update screens, exit
if (outsideSwitch.active() and insideSwitch.active()) then
    outsideSwitch.deactivate()
    insideSwitch.deactivate()
    statusLights('reset')
    closeAllDoors()
    end
-- -- if only one switch is on, then start the Airlock cycle.
-- -- -- ensure far door closed
-- -- -- open near door
-- -- -- set far door status light (red)
-- -- -- set near door status light (green)
-- -- -- set far door switch color (red)
-- -- -- set near door switch color (blue)
-- -- -- update screens with process status
-- -- -- wait six seconds
-- -- -- close near door
-- -- -- set near door status light (red)
-- -- -- set near door switch color (red)
-- -- -- update screens with process status
-- -- -- play airlock sound effect
-- -- -- wait three seconds
-- -- -- open far door
-- -- -- set far door status light (yellow)
-- -- -- update screens with process status
-- -- -- wait six seconds
-- -- -- close far door
-- -- -- set near door status light (green)
-- -- -- set near door switch color (green)
-- -- -- set far door status light (green)
-- -- -- set far door switch color (green)
-- -- -- update screens with process status
-- exit

--- end of file ---
