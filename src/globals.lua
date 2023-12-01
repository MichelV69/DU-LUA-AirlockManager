-- Initialize globals and constants
Config = { unused = true }
DEBUG = true
INGAME = system ~= nil

if not INGAME then
    if DEBUG then
        require('Codex')
        package.path = "util/du-mocks/?.lua;" .. package.path
        local mockManualButtonUnit = require("ManualButtonUnit")
        local ManualButtonUnit = mockManualButtonUnit:new()
    end
    function traceback(o)
        if o then P(tostring(o)) end
    end
else
    print = system.print
end
P = print
