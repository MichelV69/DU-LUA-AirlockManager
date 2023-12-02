-- Initialize globals and constants
Config = { unused = true }
DEBUG = true
INGAME = system ~= nil

if not INGAME then
---@if DEBUG true
    --require("mocks")
---@end
    function traceback(o)
        if o then P(tostring(o)) end
    end
else
    --require 'mockfuncs'
    print=system.print
end
P=print

--- end of file ---
