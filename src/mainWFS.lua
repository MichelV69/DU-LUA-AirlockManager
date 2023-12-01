-- DU-LuaC template with fixed slots by tobitege

-- This script is drafted to have this project entry point load most
-- required code parts via xpcall's for error handling.
-- Generally speaking such parts can be:
--  * globals -> as the name suggests ;)
--  * startup -> not used in this entry point!
--  * library -> any shared, independent objects and functions
--  * events -> DU-LuaC assignment of code to specific element's events
--  * main -> the actual main code of this project

-- First some setup code to allow debugging in VSCode.
-- These 2 lines do not interfere ingame but allow the use
-- of debuggers running the script outside of the game.
---@diagnostic disable: param-type-mismatch
package.path = "util/?.lua;" .. package.path

-- File with commonly shared, independent global constants and switches etc.
-- This is for use across multiple project entry points.
require('globals')

-- Sanity Check
    local bootErrors = 0
    if not outsideButton then bootErrors = bootErrors + 1 end
    if not  insideButton then bootErrors = bootErrors + 1 end

    if not outsideDoor then bootErrors = bootErrors + 1 end
    if not  insideDoor then bootErrors = bootErrors + 1 end

    if not outsideLight then bootErrors = bootErrors + 1 end
    if not  insideLight then bootErrors = bootErrors + 1 end

    if bootErrors then
        p(" >> Boot Error.  Missing Crucial Equipment.")
        p(" >> >> need 2 slots buttons, 2 slots doors, 2 slots lights")
        unit.exit()
    end


-- The "common-library" could contain commonly shared functions
-- for use across multiple project entries.
-- Remove or replace as needed!
local status, err, _ = xpcall(function() require('common-library') end, traceback)
if not status then
    P("[E] Error in common-library!")
    if err then P(err) end
    unit.exit()
    return
end

-- Event example: attach code to the screen's onOutputChanged event.
-- This assumes the code in the file to return a table with a Run function
-- and 1 parameter (here "output" is coming from the screen)!
-- This ONLY works with the screen being a fixed slot in the project file
-- as otherwise DU-LuaC won't be able to add its event handler code
-- in the corresponding LUA section!

--- local screenEvent = require('main-screen.onOutputChanged')
--- if screenEvent ~= nil then
---     -- important: event names start lowercase!
---     MyScreen:onEvent('onOutputChanged', function (self, output) screenEvent.Run(output) end)
--- end
---
--- -- Require the main script's code and in case of error, stop the board
--- status, err, _ = xpcall(function() require('main-onStart') end, traceback)
--- if not status then
---     P("[E] Error in main-onStart!")
---     if err then P(err) end
---     unit.exit()
--- end

-- Any additional code can be placed here
P("Script pre-load finished.")
require('app-lib')
require('app')

-- Optionally hide the programming board widget
--unit.hideWidget()

app()

--- end of file ---
