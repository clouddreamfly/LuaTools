local Signature = class('Signature')

function Signature:ctor()

    self.accessKeyId = 'gZI1mlDu9GGPkaez'
    self.accessKeySecret = 'SU96y2dNeEoR46N2iYt97RMmMNOP3FUp'

    self.params = {
        Version     = "1.0",
        UpVersion   = "1.0",     
        AccessKeyId = self.accessKeyId,
    --  ActionMethod = ''
    }
end

function Signature:dtor()
	-- body
end

function Signature:getUtcTime()
    return os.date('!%Y-%m-%dT%H:%M:%SZ')
end

function Signature:randomUuid(len)
    local chars = 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba1234567890'
    local uuid = ''
    local i = 0
    
    math.randomseed(os.time())
    len = len or 1
    for n = 1, len do
      i = math.random(1, #chars)
      uuid = uuid .. string.sub(chars, i, i)
    end
    
    return uuid
end

function Signature:percentEncode(value)

    return self:_urlEncode(value)
end

function Signature:percentStandEncode(value)

    value = string.gsub(value, "%+", "%%20")
    value = string.gsub(value, "%*", "%%2A")
    value = string.gsub(value, "%%7E", "~")

    return value
end

function Signature:_urlEncode(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
   return string.gsub(s, " ", "+")
end

function Signature:_urlDecode(s)
   s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
   return s
end

function Signature:urlEncode(datas)

    local encode = ''
    if type(datas) == 'table' then
        local keys = {}
        for k in pairs(datas) do
            table.insert(keys, k)
        end

        table.sort(keys)

        local values = {}
        for i, v in pairs(keys) do
            table.insert(values, self:_urlEncode(tostring(v)) .. '=' .. self:_urlEncode(tostring(datas[v]))) 
        end
        encode = table.concat(values, '&')
    else
        assert(false, 'this is param error, not talbe')
    end

    return encode
end

function Signature:urlDecode(datas)

    if type(datas) == 'table' then
        for k, v in pairs(datas) do
            datas[k] = self:_urlDecode(v)
        end
    end

    return datas
end

function Signature:composeStringToSign(method, params)

    table.sort(params, function(x,y) if x > y then return true else return false end end)
    local canonicalized_query_string = self:percentStandEncode(self:percentEncode(self:urlEncode(params)))
    local string_to_sign = method .. "&%2F&" .. canonicalized_query_string

    return string_to_sign
end

function Signature:_getSignature(string_to_sign, secret)
    local sign_data = string_to_sign --.. secret .. '&'
    return btBase.btUtil:md5(sign_data, string.len(sign_data))
end

function Signature:getSignature(string_to_sign, secret)

    return self:_getSignature(string_to_sign, secret or self.accessKeySecret)
end

function Signature:getSignatureEx(method, params, secret)
    local string_to_sign = self:composeStringToSign(method, params)
    return self:getSignature(string_to_sign, secret)
end

function Signature:getSignedParams(method, params)

    local signature = self:getSignatureEx(method, params)
    params['Signature'] = signature

    return self:percentStandEncode(self:urlEncode(params))
end



return Signature