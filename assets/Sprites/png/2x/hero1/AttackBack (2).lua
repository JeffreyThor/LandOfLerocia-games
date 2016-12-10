--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:01a5574b233aa5a1c2c96b53c583e13b:cac70316fc07b467599f7f48e6035206:7b1291ad2d2878b2ef18a20e1ab2408e$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- AttackBack (1)
            x=1,
            y=1,
            width=653,
            height=428,

        },
        {
            -- AttackBack (3)
            x=656,
            y=1,
            width=653,
            height=428,

        },
        {
            -- AttackBack (4)
            x=1311,
            y=1,
            width=653,
            height=428,

        },
        {
            -- DeadBack (1)
            x=1,
            y=431,
            width=653,
            height=428,

        },
        {
            -- DeadBack (2)
            x=656,
            y=431,
            width=653,
            height=428,

        },
        {
            -- DeadBack (3)
            x=1311,
            y=431,
            width=653,
            height=428,

        },
        {
            -- IdleBack (1)
            x=1,
            y=861,
            width=653,
            height=428,

        },
        {
            -- IdleBack (2)
            x=1,
            y=1291,
            width=653,
            height=428,

        },
        {
            -- IdleBack (3)
            x=656,
            y=861,
            width=653,
            height=428,

        },
        {
            -- IdleBack (4)
            x=1311,
            y=861,
            width=653,
            height=428,

        },
    },
    
    sheetContentWidth = 1965,
    sheetContentHeight = 1720
}

SheetInfo.frameIndex =
{

    ["AttackBack (1)"] = 1,
    ["AttackBack (3)"] = 2,
    ["AttackBack (4)"] = 3,
    ["DeadBack (1)"] = 4,
    ["DeadBack (2)"] = 5,
    ["DeadBack (3)"] = 6,
    ["IdleBack (1)"] = 7,
    ["IdleBack (2)"] = 8,
    ["IdleBack (3)"] = 9,
    ["IdleBack (4)"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
