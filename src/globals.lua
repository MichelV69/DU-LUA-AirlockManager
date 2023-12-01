-- Initialize globals and constants
Config = { core = nil, c_required=false,
    databanks = {}, db_required=false,
    screens = {}, s_required=false,
    switches = {}, sw_required=true,
 }
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
