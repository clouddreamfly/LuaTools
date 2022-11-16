function backtrace(msg)
    local ret = ''
    local level = 2
    ret = ret .. string.format('\nstack traceback:[%s]\n', msg or '')
    while true do
     --get stack info
        local info = debug.getinfo(level, 'Sln')
        if not info then
            break
        end
        if info.what == 'C' then                -- C function
            ret = ret .. tostring(level) .. 'C function\n'
        else           -- Lua function
            ret = ret .. string.format('[%s]:%d in function[%s]\n', info.short_src, info.currentline, info.name or '')
        end
        level = level + 1
    end
    return ret
end


function pp()
  print(backtrace("s=33333333333"))
  print(debug.traceback())
end

pp()