-----------------------------------------------------------------------------------------
--
-- soundTable.lua
--
-- All music and sounds used preloaded to be used throughout the game 
--
-----------------------------------------------------------------------------------------

local soundTable = {
    BattleMusic = audio.loadSound( "assets/Sounds/BattleMusic.mp3", {channel=1} ),
    FishingHole = audio.loadSound( "assets/Sounds/FishingHole.mp3", {channel=1} ),
    InsideHouse = audio.loadSound( "assets/Sounds/InsideHouse.mp3", {channel=1} ),
    LostWoods = audio.loadSound( "assets/Sounds/LostWoods.mp3", {channel=1} ),
    ShootingGallery = audio.loadSound( "assets/Sounds/ShootingGallery.mp3", {channel=1} ),
    StaffCredits = audio.loadSound( "assets/Sounds/StaffCredits.mp3", {channel=1} ),
    TitleTheme = audio.loadSound( "assets/Sounds/TitleTheme.mp3", {channel=1} ),
    OpeningDemo = audio.loadSound( "assets/Sounds/OpeningDemo.mp3", {channel=1} ),
    OrdonVillage = audio.loadSound( "assets/Sounds/OrdonVillage.mp3" ),
    Shop = audio.loadSound( "assets/Sounds/Shop.mp3", {channel=1} ),
    Cave = audio.loadSound( "assets/Sounds/Cave.mp3", {channel=1} ),
    Walk = audio.loadSound( "assets/Sounds/Walk.mp3", {channel = 2}),
    BossOne = audio.loadSound( "assets/Sounds/BossOne.mp3", {channel = 1} ),
    BossTwo = audio.loadSound( "assets/Sounds/BossTwo.mp3", {channel = 1} ),
    BossThree = audio.loadSound( "assets/Sounds/BossThree.mp3", {channel = 1} ),
    Sword = audio.loadSound( "assets/Sounds/Sword.mp3", {channel = 2} )
}

return soundTable