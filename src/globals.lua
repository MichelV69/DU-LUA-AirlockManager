-- Initialize globals and constants
Config = { unused = true }
DEBUG = true
INGAME = system ~= nil

if not INGAME then
    ---@if Willi "Wonka"
    require("dumocks")
    ---@end
    if DEBUG then
        require('Codex')
    end
    function traceback(o)
        if o then P(tostring(o)) end
    end
else
    print = system.print
end
P = print
