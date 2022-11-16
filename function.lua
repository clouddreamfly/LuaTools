--[[
	定义类
]]
function class(classname, super)
    local superType = type(super)
    local cls

    if superType ~= "function" and superType ~= "table" then
        superType = nil
        super = nil
    end

    if superType == "function" or (super and super.__ctype == 1) then
        -- inherited from native C++ Object
        cls = {}

        if superType == "table" then
            -- copy fields from super
            for k,v in pairs(super) do cls[k] = v end
            cls.__create = super.__create
            cls.super    = super
        else
            cls.__create = super
            cls.ctor = function() end
        end

        cls.__cname = classname
        cls.__ctype = 1

        function cls.new(...)
            local instance = cls.__create(...)
            -- copy fields from class to native object
            for k,v in pairs(cls) do instance[k] = v end
            instance.class = cls
            instance:ctor(...)
            return instance
        end

    else
        -- inherited from Lua Object
        if super then
            cls = {}
            setmetatable(cls, {__index = super})
            cls.super = super
        else
            cls = {ctor = function() end}
        end

        cls.__cname = classname
        cls.__ctype = 2 -- lua
        cls.__index = cls

        function cls.new(...)
            local instance = setmetatable({}, cls)
            instance.class = cls
            instance:ctor(...)
            return instance
        end
    end

    return cls
end

--[[
    添加属性方法
]]
function addProperty(class, varName, defaultValue, createGetter, createSetter)
    createGetter = (createGetter == nil) or createGetter;
    createSetter = (createSetter == nil) or createSetter;
    local propName = string.upper(string.sub(varName, 1, 1)) .. (#varName > 1 and string.sub(varName, 2, -1) or "")
    class[varName] = defaultValue
    if createGetter then
        class[string.format("get%s", propName)] = function(self)
            return self[varName] or defaultValue;
        end
    end

    if createSetter then
        class[string.format("set%s", propName)] = function(self,var)
            self[varName] = var;
            return self
        end
    end
end