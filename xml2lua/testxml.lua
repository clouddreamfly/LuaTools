package.path = 'D:\\Workspace\\lua\\?.lua;D:\\Workspace\\server_kaka_app\\?.lua;' .. package.path
require("dump")
local xml2lua = require("xml2lua")
local xmlhandler = require("xmlhandler.tree")


local handler = xmlhandler:new()
local xmlparser = xml2lua.parser(handler)
xmlparser:parse([[<?xml version="1.0"?>
<!-- Source: https://msdn.microsoft.com/en-us/library/ms762271(v=vs.85).aspx -->
<catalog>
   <book>
      <author>Gambardella, Matthew</author>
      <title>XML Developer's Guide</title>
      <genre>Computer</genre>
      <price>44.95</price>
      <publish_date>2000-10-01</publish_date>
      <description>An in-depth look at creating applications 
      with XML.</description>
   </book>
   <book>
      <author>Ralls, Kim</author>
      <title>Midnight Rain</title>
      <genre>Fantasy</genre>
      <price>5.95</price>
      <publish_date>2000-12-16</publish_date>
      <description>A former architect battles corporate zombies, 
      an evil sorceress, and her own childhood to become queen 
      of the world.</description>
   </book>
   <book>
      <author>Corets, Eva</author>
      <title>Maeve Ascendant</title>
      <genre>Fantasy</genre>
      <price>5.95</price>
      <publish_date>2000-11-17</publish_date>
      <description>After the collapse of a nanotechnology 
      society in England, the young survivors lay the 
      foundation for a new society.</description>
   </book>
</catalog>]])


dump(handler.root)
local str = xml2lua.toXml(handler.root, "shanghai")
print(str)

print(math.random(1, 100))

