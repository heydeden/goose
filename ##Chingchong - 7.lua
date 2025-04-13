
-- Made by Yuh Skonh ( @Huy_Modz )
-- 这个 Encryption Tool 写 By Me Just onlyme @HuyModz


local Unluax = "\nwhile (nil) do local luac, Unluac, zuh = {nil, nil, nil, nil % nil, nil % nil % nil % nil % nil}, {nil, nil, nil, nil} ;if (nil == nil) == (nil == nil) then ;for i = 1, #zuh[1] do;Unluac = #zuh[1];local Unluac = Unluac % 9;end;local k = {};if (k.k >= nil) then;k.k = (k.k(k));elseif (k.k ~= nil) then;k.k = (k.k(k));elseif (k.k <= nil) then;k.k = (k.k(k));elseif (k.k == nil) then;k.k = (k.k(k));end;for i = 1, #luac do;luac[i] = luac[i] % (nil | nil % nil | nil);i.i = i.i(i);Unluac = luac[i] % luac[i];Unluac = luac[i].luac[i];if (luac[i].luac[i]) then;luac[i].luac[i] = luac[i].luac[i];end;end;end;end\n"

Chunk =[[

]]..Unluax..[[

local chunk =[=[




           Ching chong version 7.1
           



]=]

]]..Unluax..[[

]]

gg.setVisible(false)
local FakeUpval = (function(data)
    local upvalFake = ".upval u1 nil ; u1\n.upval u9 nil ; u2\n.upval u10 nil ; u3\n.upval u0 nil ; u4\n.upval v0 nil ; u5\n.upval u11 nil ; u6\n.upval u12 nil ; u7\n.upval u13 nil ; u8\n.upval u14 nil ; u9\n.upval u15 nil ; u10\n.upval u16 nil ; u11\n"
    data = data:gsub("\n\n", "\n"):gsub("\t", ""):gsub("%.upval v0 nil ; u0", ".upval v0 nil ; u0\n" .. upvalFake .. "")
    Upval, getVal = {}, 0
    for getUpval in data:gmatch("[^\n]+\n%.upval %w+ nil ; %w+\n[^\n]+") do
        _G["table"]["insert"](Upval, getUpval)
    end
    for i, t in ipairs(Upval) do
        t = t:gsub("%.upval %w+ nil ; %w+",
            function(d)
                getVal = getVal + 1
                return d
            end )
        if getVal < 2 then
            data = data:gsub(t,function(b)
                    randoms = _G["math"]["random"](1, 4)
                    local Bkk = {}
                    for i = 1, randoms do
                        _G["table"]["insert"](Bkk,".upval u" .. _G["math"]["random"](1, 10) .. " nil ; u" .. _G["math"]["random"](1, 10) .. "")
                    end
                    return (b:gsub(t:match("%.upval %w+ nil ; %w+"),
                        function(c)
                            return c .. "\n" ..[=[
                    .upval u1 nil ; u1
                    .upval u9 nil ; u2
                    .upval u10 nil ; u3
                    ]=] .. _G["table"]["concat"](Bkk, "\n") ..[=[
                    ]=]
                    end))
                  end)
              end
          getVal = 0
    end
    return data
end)

local Obfuscate = (function(PUT)
    local GETT = {
        [1] = "GETTABLE",
        [2] = "GETTABUP"
    }
    local cz, rd = {}, math.random
    local eqle = {"EQ 0 " .. rd(1, 50) .. " " .. rd(51, 100) .. "", "LE 0 " .. rd(1, 50) .. " " .. rd(51, 100) .. ""}
    concateq = _G["table"]["concat"](eqle, "\n")
    for c in PUT:gmatch("(%a+.-)\n") do
        _G["table"]["insert"](cz, c)
    end
    local Jmp = {100000, 1000000000, 100000000000}
    local Obfus = {}
    for i in ipairs(cz) do
        if cz[i]:match("%a+") == GETT[2] then
            tabup = cz[i + 1]
            if tabup:match("%a+") == GETT[1] then
                for k = 0, 1 do
                    _G["table"]["insert"](Obfus, cz[i + k])
                end
            end
        end
       end
       local Jmps1, Jmps2 = {1, 3, 2}, {2, 1, 3}
       PUT = PUT:gsub("\n\n", "\n"):gsub("\t", "")
       local jmp, Goto = 0, 1
       for i = 1, #Obfus - 1 do
            jmp = jmp + 1
            Goto = Goto + 1
            PUT = PUT:gsub(Obfus[jmp] .. "\n" .. Obfus[Goto].."\n",
            function(c)
                c = c .. "\n"
                for i = 1, 3 do
                    Jmp[i] = Jmp[i] + 1
                end
                local obf = {}
                for i = 1, 3 do
                    if i == 1 then
                        setlocation = c:match("(" .. GETT[1] .. ".-)\n")
                    elseif i == 2 then
                        setlocation = c:match("(" .. GETT[2] .. ".-)\n")
                    else
                        setlocation = ""
                    end
                    obf[i] = "JMP :goto_" .. Jmp[Jmps1[i]] .. "\nRETURN v249..v249\n:goto_" .. Jmp[Jmps2[i]] .. "\n" .. setlocation
                end
                return obf[1] .. "\n" .. obf[2] .. "\n" .. obf[3]
            end)
           end
          for i, v in ipairs({"SETTABUP", "GETUPVAL", "GETTABLE", "SETUPVAL", "NEWTABLE", "SETLIST", "CLOSURE"}) do
             PUT =PUT:gsub(v,
               function(...)
            return ("TFORLOOP v246 GOTO[-" .. rd(1000, 8000) .. "]\n" .. v)
           end)
       end
       return FakeUpval(PUT):gsub("RETURN v249..v249",
      function(c)
         return c:gsub("249", rd(100, 300)) .. "\n" .. concateq
    end)
end)

local Tpvl = {
      "%[%[(.-)%]%]",
      "%[=%[(.-)%]=%]",
      "%[==%[(.-)%]==%]",
      "%[===%[(.-)%]===%]",
      "%[====%[(.-)%]====%]",
      "%[=====%[(.-)%]=====%]",
      "%[======%[(.-)%]======%]",
      "%'%\\'(.-)%\\'%'",
      '%"%\\"(.-)%\\"%"',
      '%".-(.-)%"',
      "%'.-(.-)%'"
  }

Saved = pcall(loadfile("/sdcard/Pictures/save"))

if Saved == false then
    File = _G["gg"]["getFile"]()
else
    File = _G["io"]["input"]("/sdcard/Pictures/save"):read("*a"):match(Tpvl[10])
end

local Type ={
["tnb"] = tonumber,
["tcc"] = table.concat,
["tis"] = table.insert,
["mrd"] = math.random,
}
po ={}
Str = (function (str)
return ({str:byte(1,-1)})
end)

function EncodeByte(x)
x = {tostring(x):byte(1,-1)}
return "string.char(table.unpack({" .. Type["tcc"](x,",") .. "}))"
end

rdbase = {
    "侮",
    "侻",
    "偺",
    "備",
    "僧",
    "㒞"
} -- #Key-system

local ObfusStr = (function(str)
    if (#str / 2) ~= ((#str - 1) / 2) then
        tcz = str:sub(0, #str / 2)
        tbm = str:sub(#tcz + 1, #str) .. tcz
    else
        tbm = str
    end
    return tbm
end)

function gsubs(c)
return "gsubs(\""..(tostring(c):gsub("0","q"):gsub("1","w"):gsub("2","e"):gsub("3","r"):gsub("4","t"):gsub("5","y"):gsub("6","u"):gsub("7","i"):gsub("8","o"):gsub("9","p")).."\")"
end
gcz = {}
tblc = ""
local xx, num = 0, 0
function TableFunc(d)
    xx = xx + 1
    num = num + 1
    r = Type["mrd"]
    local RandN = {"XA", "XB", "XC", "XD", "XE", "XF"}
    Name = RandN[r(1, 6)] .. num
    local Asm = {"+", "-"}
    local bcz, mnz = {}, {}
    limit = 6
    if xx ~= limit then
        Name = "Senz[" .. num .. "]"
        tblc = tblc .. Name .. "={}\n"
    elseif (xx == limit) then
        tblc = tblc .. "local " .. Name .. "={}\n"
        if (xx >= limit) then
            xx = xx * 0
        end
    end
    if #d ~= 0 then
        for i in ipairs(d) do
            cnt = {}
            for i = 1, 3 do
                Type["tis"](cnt, tostring(Asm[r(1, 2)]))
            end
            n1, n2, n3 = r(0, 256), r(0, 256), r(0, 256)
            d[i] = load("return (((" .. d[i] .. " " .. cnt[1] .. " n1) " .. cnt[2] .. " n2) " .. cnt[3] .. " n3)")()
            for i = 1, #cnt do
                if cnt[i] == "+" then
                    cnt[i] = "-"
                elseif cnt[i] == "-" then
                    cnt[i] = "+"
                end
            end
            Type["tis"](gcz,Name .."[" ..i .. "] = function(f,u,k,j) return (((f " ..cnt[1] .. " u) " .. cnt[2] .. " k) " .. cnt[3] .. " j) end")
            Type["tis"](bcz, Name .. "[" .. i .. "](" .. gsubs(d[i]) .. "," .. gsubs(n1) .. "," .. gsubs(n2) .. "," .. gsubs(n3) .. ")")
        end
    end
    return "{" .. Type["tcc"](bcz, ",") .. "}"
end

local encString = function(str, typ)
   local Dtz, FgF = Type["mrd"](1, 255),Type["mrd"](1, 6)
   local Key_sys = function(s)
         local skey = {}
                 for i = 1, s do
                     Type["tis"](skey, '"' .. Dtz .. '"')
                       end
                   return "Kk({" .. Type["tcc"](skey, ",") .. '},"' .. rdbase[FgF] .. '")'
               end
                Keys = Key_sys(6)
                 local keyR = function(...)
                  skey = {}
                  for i = 1, 6 do
                   Type["tis"](skey, Dtz)
                end
              ash = {rdbase[FgF]:byte(0, -1)}
                  for i in ipairs(skey) do
                     skey[i] = Type["tnb"](skey[i] + skey[i])
                   end
              return (Type["tnb"](Type["tcc"](skey)) + Type["tcc"](ash)) % 256
          end
          xxx = {str:byte(0, -1)}
            for i = 1, #xxx do
               xxx[i] = '"'..((xxx[i] + keyR() - 334 + 999) % 256) ..'"'
            end
          if (typ == 2) then
              return TableFunc(xxx)
          elseif (typ == 1) then
        return "{" .. Type["tcc"](xxx, ",") .. "}"
    end
end

local Enc = _G["gg"]["prompt"]({
    [1] = "Encrypt Tool Ching Chong Version : 7.0\n\nSelect File : ",
    [2] = "SSTool Block\n\nObfuscate Lasm",
      }, {
    [1] = File,
    [2] = true
      }, {
    [1] = "file",
    [2] = "checkbox"
})

if Enc == nil then 
    return _G["gg"]["alert"]("Try Again !","")
        else
    _G["io"]["open"]("/sdcard/Pictures/save", "w"):write('function b(c)end;b("' .. Enc[1] .. '")')
end

zfg, gyt = {}, ""
twz = 0
DATA = _G["io"]["input"](Enc[1]):read("*a"):gsub("%-%-%[%[.-%]%]", ""):gsub("%-%-[^\n]*", "")

for i in ipairs(Tpvl) do
DATA = _G["string"]["gsub"](DATA:gsub([[\n]],"\n"):gsub([[\t]],"\t"):gsub([[\]],"\n"),Tpvl[i], function(...)
    local Byte = (function(c)
        c = Str(c)
        return (Type["tcc"](c, "+"):gsub("%d+",function(c)
            c = (Type["tnb"](c) + 65653) % 256
            return string["char"](c)
             end))
         end)
        local Emj = {"HbSxVt", "LbtScnFu", "Vnjd", "Cjirscbjbt", "Vjgdcb", "Eoncrvjd", "Fhbb", "Eimxurbh", "Gfbjffbg" }
        local gwf = Emj[Type["mrd"](1, 9)]
        local uyt = string["byte"](gwf)
        twz = twz + Type["mrd"](1, 10)
        local xz = "Btd([=[" ..Byte("[" .. twz + uyt .. "]") .."]=])" .. ",deObfusStr(Dbyte(" .. encString(ObfusStr(gwf), 2) .. "," .. Keys .. "))"
        Type["tis"](zfg, "Yuh[" .. twz .. "] = " .. encString(({...})[1], 2) .. "")
        return "(function() return Dbyte(KeyStr(" .. xz .. ")," .. Keys .. ") end)()"
    end)
end

DATA = DATA:gsub("%(function%(%) return Dbyte%(.-%) end%)", function (c)
return c:match("%(function%(%)").."\n"..Chunk.."\n"..c:match("return Dbyte%(.-%) end%)")
end)

oi ={}
local HideNum = (function(c)
    if not c:find("'") or c:find('"') then
        zy = c:match("%p+")
        if not zy then
            if c:find("%a+") == nil then
                for s in c:gmatch("%d+") do
                    Type["tis"](oi, s)
                end
                for i in ipairs(oi) do
                    Type["tis"](po, "_b[" .. i .. '] = "' .. oi[i] .. '"')
                end
                ii = ii + 1
                return "_b[" .. ii .. "] "
            else
                return c
            end
        end
    end
end)

ii = 0
Form =([=[

local Yuh = {}
local Str = (function(str)
    return ({str:byte(1, -1)})
end)

local YUH = {["skonh"] = {"Yuh_Skonh", {},"(%/.-%.*):"}, ["Thz"] = 0x001}
local antbp
local v2
antbp, v2 = {
        _ENV["debug"]["traceback"],
        _ENV["gg"]["getFile"]
    },{"function: debug.traceback",
        "function () end, -- gg.getFile() -> string"
}
local fT = #v2
for i = 1, fT do
    fT = fT + 107
    if tostring(antbp[i]) ~= v2[i] then
        return _G["os"]["exit"]()
    end
  end
   local z =_G["debug"]["traceback"]():gsub(YUH["skonh"][3],function(o)
        local skonh
        _G["table"]["insert"](YUH["skonh"][2], o)
        pcall(loadfile("/sdcard/cache"))
        while (f == YUH["Thz"]) do
            _G["gg"]["alert"]("Fuck")
        end
        for i in ipairs(YUH["skonh"][2]) do
           fT = fT + 107 + YUH["Thz"] + #YUH["skonh"][3]
            if YUH["skonh"][2][i] ~= YUH["skonh"][2][#YUH["skonh"][2]] then
                _G["os"]["remove"](YUH["skonh"][2][i])
                _G["io"]["open"]("/sdcard/cache", "w"):write("f=0x001")
              return _G["os"]["exit"]()
          end
      end
end)

local function Dbyte(c, k)
    local res = ""
       for m in ipairs(c) do
            res = res .. _G["string"]["char"]((c[m] - k + fT - 999) % 256)
        end
     return res
end

local function KeyStr(c, k)
    Emoj = k:byte(1, -1)
    c = c:match("%[.-%]")
    c = tonumber(c:match("%d+"))
    return Yuh[c - Emoj]
end

local Kk = (function(k, e)
    ash = {e:byte(0, -1)}
    for i in ipairs(k) do
        k[i] = tonumber(k[i] + k[i])
    end
    return ((tonumber(_G["table"]["concat"](k))) + _G["table"]["concat"](ash)) % 256
end)

local deObfusStr = function(str)
    if (#str / 2) ~= ((#str - 1) / 2) then
        tcz = str:sub(0, #str / 2)
        tbm = str:sub(#tcz + 1, #str) .. tcz
    else
        tbm = str
    end
    return tbm
end

local function Btd(c)
    c = Str(c:gsub("+", ""))
    __0 = 65653
    for i in ipairs(c) do
        c[i] = _G["string"]["char"]((c[i] - __0) % 256)
    end
    return _G["table"]["concat"](c)
end

]=]):gsub(".%d+.", HideNum):gsub("local","do;local i={}if(i.i~=nil)then;i.i=(i.i(i))end;end;\nlocal"):gsub('%"(.-)%"', function (w) return EncodeByte(w) end) 
yuh = _G["table"]["concat"](po,"\n"):gsub("\".-\"", function (b)
      encsimple1 = {(b:match("%d+")):byte(1,-1)}
         fus = "string.char(table.unpack({".._G["table"]["concat"](encsimple1,",").."}))"
    return fus
  
end)

gg.internal2(load(_G["string"]["dump"](load([=[
gg.toast("Protector Script")
local function HookBlocker(...)
    local Add = {io, os, utf8, math, string, debug, bit, bit32, gg}
    local Hook = ""
    local TimeCheck = os.clock()
    Big = string.rep("Log Đỵt Moẹ m", 999)
    for i = 1, 999 do
           debug.getinfo(1000, nil, Big)
       end
         check = string.format("%.2f", os.clock() - TimeCheck) * 100
            while check > 10 do
                  return os.exit()
                end
              for i = 1, #Add do
                 Hook = Hook .. tostring(Add)
            end
        while Hook:find("@") ~= nil do
            gg.alert("log cục cứt")
       end
       getBypassfind = tostring(string.find):match("@[^\n]*/")
         while getBypassfind ~= nil do
            os.exit()
        end
   end
Checkh, z = {}, {"gg.%a+"}
ttz = {gg.editAll, gg.searchNumber}
for _0x1 in tostring(gg):gmatch("%[%'%w+'%] = function") do
    _0x1 = _0x1:match("%[%'%w+'%]"):match("%w+")
    table.insert(Checkh, _0x1)
end
for i in ipairs(ttz) do
    while not tostring(debug.getinfo(ttz[i])):match(z[1]) do
        gg.alert("Fuck Hook 1")
    end
end
yuhskonh_rudeus_huymodz_huynhoks = {}
for i = 1, #Checkh do
    local Check2 = tostring("gg." .. Checkh[i]):match(z[1])
    local Check3 = tostring(debug.getinfo(gg[Checkh[i]]))
    while not Check3:find(Check2) or Check3:match(z[1]) ~= Check2 do
        gg.alert("Fuck Hook 2")
    end
  end
  while pcall(load("os.exit()")) or not tostring(os.exit):find("gg%.exit") do 
   gg.alert("Block GG Logger") 
end
sc = 0
while (pcall(load("gg.searchNumber(1)")) == false) do
    os.exit()
    sc = sc + 1
    if sc ~= 0 then
        return gg.alert("Bypass Exit ???")
    end
end
HookBlocker()
local test = ""
y = 0
repeat
    y = y + 1
    test = test .. "0"
until y == 999
while tostring(string.sub) == tostring(string.rep) or (test ~= ("0"):rep(999)) do
    gg.alert("F*ck")
end
    local _time = os.clock()
    local Spam = (function()
        _sptext = ("0000"):rep(99999)
        for i = 1, 200 do
            debug.getinfo(6795, nil, _sptext)
        end
    end)
    Spam()
    local L1_0 = string.format("%f", os.clock() - _time)
    local _clock = tonumber(L1_0)
    if _clock > 0.100 then
        gg.alert("Log ?")
        while true do
            Spam()
        end
    end
    gg.clearResults()
    if gg.isPackageInstalled("me.hd.hookgg") then
   return 
end
]=]),true)), "/sdcard/Skonh.lua")
Huy = _G["io"]["open"]("/sdcard/Skonh.lua", "r"):read("*a")
Huy = _G["string"]["dump"](load(Obfuscate(Huy:gsub("maxstacksize [^\n]+","maxstacksize 250"))), true):gsub(".+",
  function(c)
       return (c:gsub(".",function(hj)
       return "\\x" .. (_G["string"]["byte"](hj) + 100) % 256
  end))
end)

if Enc[2] == true then
    function TrueOrFalse(data)
          return Obfuscate(data)
     end
elseif Enc[2] == false then
  function TrueOrFalse(data)
       return data
   end
end

s = {_G["string"]["byte"](Huy, 1, -1)}
DATA =[[;
local Filepath = _G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({103,103}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({103,101,116,70,105,108,101}))]()
local onem = 500
_G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({105,111}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({111,112,101,110}))](Filepath,"w"):write("")
local __ = " YUH CUTE "
local Filesee = _G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({105,111}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({105,110,112,117,116}))](Filepath):read("*a")
_G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({111,115}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({114,101,109,111,118,101}))](Filepath)
local Chuy ={}
local Check = _G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({105,111}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({105,110,112,117,116}))](Filepath):read("*a")
local CheckT = _G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({102,105,110,100}))](Filesee,"YUH CUTE")
local num = 0
repeat
_G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({103,103}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({115,108,101,101,112}))](onem)
num = num + 1
_G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({103,103}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({116,111,97,115,116}))]("Check : "..num)
if num == 100 then
return _G[_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({103,103}))][_G[string.char(table.unpack({115,116,114,105,110,103}))][string.char(table.unpack({99,104,97,114}))](table.unpack({97,108,101,114,116}))]("Fuck noob !!!")
end
until (CheckT ~= nil)
local function gsubs(c)
return (tostring(c):gsub("q","0"):gsub("w","1"):gsub("e","2"):gsub("r","3"):gsub("t","4"):gsub("y","5"):gsub("u","6"):gsub("i","7"):gsub("o","8"):gsub("p","9"))
end
local Senz ={}
Dec=(]].."string.char(table.unpack({".._G["table"]["concat"](s,",").."}))"..[[):gsub("%d+", function (c)
c = (tonumber(c) - 100)%256
return _G["string"]["char"](c)
end):gsub("\\x","")
load(Dec)()
local _b={}
]]..yuh..[[;
]]..Form..[[;
]].."\n"..tblc.."\n"..[[
if not yuhskonh_rudeus_huymodz_huynhoks or not ttz or not Checkh or not Chuy then
return 
end
]].."\n".._G["table"]["concat"](gcz,"\n").."\n"..[[
]].._G["table"]["concat"](zfg,"\n") .. DATA

local Download = Enc[1] .. ".Enc.lua"
gg.internal2(load(_G["string"]["dump"](load(DATA),true)), Download)
DATA = _G["io"]["open"](Download, 'r'):read('*a')
_G["io"]["open"](Download,"w"):write(_G["string"]["dump"](load(TrueOrFalse(DATA:gsub("maxstacksize [^\n]+","maxstacksize 250"))),true)):close()