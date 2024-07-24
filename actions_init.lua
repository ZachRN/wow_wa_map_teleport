local LIBRARY_NAME = "Zach's and Eathox's Dungeon Teleport Buttons"
local Library = _G[LIBRARY_NAME]
-- https://wowpedia.fandom.com/wiki/UiMapID

if Library then -- Config updated, update buttons
    Library.config = aura_env.config
    Library:UpdateButtons()
    return
end

Library = {}

local function AddSpellMaps(mapTable, spellId, mapIds, parentMapId)
	local function AddUnique(mapTable, spellId, mapId)
		if not mapTable[mapId] then
			mapTable[mapId] = {}
		end
		mapTable[mapId][spellId] = true
	end

	if mapIds then
		for _, mapId in pairs(mapIds) do
			AddUnique(mapTable, spellId, mapId)
		end
	end

	if parentMapId then
		AddUnique(mapTable, spellId, parentMapId)
	end
end

function Library:InitializeMapTables()
	-- Instance --
	local instance = {}
	self.INSTANCE_MAP_TO_SPELL = instance

	-- Cataclysm
	AddSpellMaps(instance, 410080, { 325 }, 249) -- The Vortex Pinnacle, Uldum
	AddSpellMaps(instance, 424142, { 322, 323 }, 204) -- Throne of the Tides, Abyssal Depths
	-- AddSpellMaps(instance, nil, { 293 }, 241) -- Grim Batol, Twilight Highlands

	-- Pandaria
	AddSpellMaps(instance, 131204, { 429, 430 }, 371) -- Temple of the Jade Serpent, The Jade Forest
	AddSpellMaps(instance, 131231, { 431, 432 }, 18) -- Scarlet Halls, Tirisfal Glades - Maybe 997/1247/2070?
	AddSpellMaps(instance, 131229, { 435, 436 }, 18) -- Scarlet Monastery, Tirisfal Glades - Maybe 997/1247/2070?
	AddSpellMaps(instance, 131225, { 437, 438 }, 422) -- Gate of the Setting Sun, Dread Wastes
	AddSpellMaps(instance, 131228, { 457, 458, 459 }, 379) -- Siege of Niuzao Temple, Townlong Steppes
	AddSpellMaps(instance, 131206, { 443, 444, 445, 446 }, 379) -- Shado-Pan Monastery, Kun-Lai Summit
	AddSpellMaps(instance, 131222, { 453, 454, 455, 456 }, 390) -- Mogu'shan Palace, Vale of Eternal Blossoms
	AddSpellMaps(instance, 131205, { 439, 440, 441, 442 }, 376) -- Stormstout Brewery, Valley of the Four Winds
	AddSpellMaps(instance, 131232, { 476, 477, 478, 479 }, 22) -- Scholomance, Western Plaguelands - Maybe 1249 for WPL?

	-- Warlords of Draenor
	AddSpellMaps(instance, 159895, { 573 }, 525) -- Bloodmaul Slag Mines, Frostfire Ridge
	AddSpellMaps(instance, 159897, { 593 }, 535) -- Auchindoun, Talador
	AddSpellMaps(instance, 159896, { 595 }, 543) -- Iron Docks, Gorgrond
	AddSpellMaps(instance, 159898, { 601, 602 }, 542) -- Skyreach, Spires of Arak
	AddSpellMaps(instance, 159901, { 620, 621 }, 543) -- The Everbloom, Gorgrond
	AddSpellMaps(instance, 159899, { 574, 575, 576 }, 534) -- Shadowmoon Burial Grounds, Tanaan Jungle
	AddSpellMaps(instance, 159902, { 616, 617, 618 }, 32) -- Upper Blackrock Spire, Searing Gorge - Maybe 1254
	AddSpellMaps(instance, 159900, { 606, 607, 608, 609 }, 543) -- Grimrail Depot, Gorgrond

	-- Legion
	AddSpellMaps(instance, 410078, { 731 }, 650) -- Neltharion's Lair, Highmountain
	AddSpellMaps(instance, 424163, { 733 }, 641) -- Darkheart Thicket, Val'sharah
	AddSpellMaps(instance, 393764, { 703, 704, 705 }, 634) -- Halls of Valor, Stormheim
	AddSpellMaps(instance, 393766, { 761, 762, 763 }, 680) -- Court of Stars, Suramar
	AddSpellMaps(instance, 424153, { 751, 752, 753, 754, 755, 756 }, 641) -- Black Rook Hold, Val'sharah
	AddSpellMaps(instance, 373262, { 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822 }, 42) -- Karazhan, Deadwind pass - Maybe 1257?
	-- AddSpellMaps(instance, nil, { 713 }, 630) -- Eye of Azshara, Azsuna
	-- AddSpellMaps(instance, nil, { 749 }, 680) -- The Arcway, Suramar
	-- AddSpellMaps(instance, nil, { 903 }, 882) -- The Seat of the Triumvirate, Eredath
	-- AddSpellMaps(instance, nil, { 732 }, 627) -- Violet Hold, Dalaran
	-- AddSpellMaps(instance, nil, { 706, 707, 708 }, 634) -- Maw of Souls, Stormheim
	-- AddSpellMaps(instance, nil, { 710, 711, 712 }, 630) -- Vault of the Wardens, Azsuna
	-- AddSpellMaps(instance, nil, { 845, 846, 847, 848, 849 }, 646) -- Cathedral of eternal Night, Broken Shore

	-- Battle for Azeroth
	AddSpellMaps(instance, 410071, { 936 }, 895) -- Freehold, Tiragarde Sound
	AddSpellMaps(instance, 424187, { 934, 935 }, 862) -- Atal'Dazar, Zuldazar
	AddSpellMaps(instance, 410074, { 1041, 1042 }, 863) -- The Underrot, Nazmir
	AddSpellMaps(instance, 424167, { 1015, 1016, 1017, 1018, 1029 }, 896) -- Waycrest Manor, Drustvar
	AddSpellMaps(instance, 373274, { 1490, 1491, 1493, 1494, 1497 }, 1462) -- Operation: Mechagon, Mechagon Island
	-- AddSpellMaps(instance, nil, { 1010 }, 194) -- The MOTHERLODE!!, Kezan
	-- AddSpellMaps(instance, nil, { 1004 }, 862) -- Kings' Rest, Zuldazar
	-- AddSpellMaps(instance, nil, { 1162 }, 895) -- Siege of Boralus, Tiragarde Sound
	-- AddSpellMaps(instance, nil, { 1038, 1043 }, 864) -- Temple of Sethraliss, Vol'dun
	-- AddSpellMaps(instance, nil, { 1039, 1040 }, 942) -- Shrine of the Storm, Stormsong Valley
	-- AddSpellMaps(instance, nil, { 974, 975, 976, 977, 978, 979, 980 }, 895) -- Tol Dagor, Piragarde Sound

	-- Shadowlands
	AddSpellMaps(instance, 354464, { 1669 }, 1565) -- Mists of Tirna Scithe, Ardenweald
	AddSpellMaps(instance, 354469, { 1675, 1676 }, 1525) -- Sanguine Depths, Revendreath
	AddSpellMaps(instance, 354463, { 1674, 1697 }, 1536) -- Plaguefall, Maldraxxus
	AddSpellMaps(instance, 354462, { 1666, 1667, 1668 }, 1533) -- The Necrotic Wake, Bastion
	AddSpellMaps(instance, 354465, { 1663, 1664, 1665 }, 1525) -- Halls of Atonement, Revendreath
	AddSpellMaps(instance, 354468, { 1677, 1678, 1679, 1680 }, 1565) -- De Other Side, Ardenweald
	AddSpellMaps(instance, 354466, { 1692, 1693, 1694, 1695 }, 1533) -- Spires of Ascension, Bastion
	AddSpellMaps(instance, 354467, { 1683, 1684, 1685, 1686, 1687 }, 1536) -- Theater of Pain, Maldraxxus
	AddSpellMaps(instance, 367416, { 1989, 1990, 1991, 1992, 1993, 1995, 1996, 1997 }, 1670) -- Tazavesh the Veiled Market, Oribos

	-- Dragonflight
	AddSpellMaps(instance, 393262, { 2093 }, 2023) -- The Nokhud Offensive, Ohn'ahran Plains
	AddSpellMaps(instance, 393256, { 2094, 2095 }, 2022) -- Ruby Life Pools, The Waking Shores
	AddSpellMaps(instance, 393222, { 2071, 2072 }, 15) -- Uldaman: Legacy of Tyr, Badlands - Maybe 1245?
	AddSpellMaps(instance, 393276, { 2080, 2081 }, 2022) -- Neltharus, The Waking Shores
	AddSpellMaps(instance, 393267, { 2096, 2106 }, 2024) -- Brackenhide Hollow, The Azure Span
	AddSpellMaps(instance, 393283, { 2082, 2083 }, 2025) -- Halls of Infusion, Thaldraszus
	AddSpellMaps(instance, 393273, { 2097, 2098, 2099 }, 2025) -- Algeth'ar Academy, Thaldraszus
	AddSpellMaps(instance, 393279, { 2073, 2074, 2075, 2076, 2077 }, 2024) -- The Azure Vault, The Azure Span
	AddSpellMaps(instance, 424197, { 2190, 2191, 2192, 2193, 2194, 2195, 2196, 2197, 2198 }, 2025) -- Dawn of the Inifine, Thaldraszus

	-- Dragonflight Raids
	AddSpellMaps(instance, 432257, { 2166, 2167, 2168, 2169, 2170 }, 2133) -- Aberrus, Zaralek Cavern
	AddSpellMaps(instance, 432254, { 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126 }, 2025) -- Vault of the Incarnates, Thaldraszus
	AddSpellMaps(instance, 432258, { 2232, 2233, 2234, 2235, 2236, 2237, 2338, 2244, 2240 }, 2200) -- Amirdrassil, Emerald Dream

	-- Mage --
	local mage = {}
	self.MAGE_MAP_TO_SPELL = mage

	-- Alliance
	AddSpellMaps(mage, 49360, nil, 70) -- Theramore (Dustwallow March)
	AddSpellMaps(mage, 11416, { 87 }, 27) -- Ironforge, Dun Morogh
	AddSpellMaps(mage, 10059, { 84 }, 37) -- Stormwind, Elwyrnn Forest
	AddSpellMaps(mage, 11419, { 89 }, 57) -- Darnassus, Teldrassil
	AddSpellMaps(mage, 32266, { 103 }, 97) -- Exodar, Azuremyst Isle
	AddSpellMaps(mage, 176246, { 622 }, 588) -- Stormshield, Ashran
	AddSpellMaps(mage, 267877, { 1161 }, 895) -- Boralus, Tiragarde Sound

	-- Horde
	AddSpellMaps(mage, 49361, nil, 51) -- Stormwind (Swamp of Sorrows)
	AddSpellMaps(mage, 11417, { 85 }, 1) -- Orgrimmar, Durotar
	AddSpellMaps(mage, 11418, { 90 }, 18) -- Undercity, Tirisfal Glade
	AddSpellMaps(mage, 11420, { 88 }, 7) -- Thunderbluff, Mulgore
	AddSpellMaps(mage, 32267, { 110 }, 94) -- Silvermoon, Eversoong Woods
	AddSpellMaps(mage, 176244, { 624 }, 588) -- Warspear, Ashran
	AddSpellMaps(mage, 281402, { 1165 }, 862) -- Dazar'alor, Zuldazar

	-- Neutral
	AddSpellMaps(mage, 132620, nil, 390) -- Vale of eternal Blossoms ALLIANCE
	AddSpellMaps(mage, 132626, nil, 390) -- Vale of eternal Blossoms HORDE
	AddSpellMaps(mage, 88345, nil, 244) -- Tol Barad ALLIANCE
	AddSpellMaps(mage, 88346, nil, 244) -- Tol Barad HORDE
	AddSpellMaps(mage, 120146, nil, 25) -- Dalaran Crater
	AddSpellMaps(mage, 33691, { 111 }, 108) -- Shattrath, Terokkar Forest
	AddSpellMaps(mage, 53142, { 125 }, 127) -- Dalaran, Crystalsong Forest
	AddSpellMaps(mage, 224871, { 627 }, 619) -- Dalaran, Broken Isles
	AddSpellMaps(mage, 344597, { 1670 }, 1550) -- Oribos, The Shadowlands
	AddSpellMaps(mage, 395289, { 2112 }, 2025) -- Valdrakken, Thaldraszus

	-- Druid --
	local druid = {}
	self.DRUID_MAP_TO_SPELL = druid

	AddSpellMaps(druid, 193753, { 2239, 747, 641, 69, 116, 198, 47, 26, 80 }) -- Dreamwalk
	AddSpellMaps(druid, 18960, { 80 }) -- MOOOOOOOOOOOOOOOOOOOOOONGLADE BABY
end

function Library:CreateButton()
    local button = CreateFrame("Button", nil, Library.rootFrame, "InSecureActionButtonTemplate")
    button:RegisterForClicks("AnyDown", "AnyUp")

    -- Black 60% opacity overlay
    button.notKnown = button:CreateTexture(nil, "OVERLAY")
    button.notKnown:SetAllPoints()
    button.notKnown:SetColorTexture(0, 0, 0, 0.6)

    function button:ApplyStyling()
        self:SetSize(Library.config.buttonSize, Library.config.buttonSize)
        if WorldMapFrame:IsMaximized() then
            self:SetScale(1.4)
        else
            self:SetScale(1)
        end

        local texture = self:GetNormalTexture()
        if Library.config.hideIconBorder then
            texture:SetTexCoord(0.075, 0.925, 0.075, 0.925) -- Zoom in 30% (removes border)
        else
            texture:SetTexCoord(0, 1, 0, 1)
        end
    end

    function button:ShowWithSpell(spellId)
        if not spellId then return end
        local _, _, spellIcon = GetSpellInfo(spellId)

        self:SetAttribute("type", "spell")
        self:SetAttribute("spell", spellId)
        self:SetNormalTexture(spellIcon)

        self:SetCooldownEnabled(IsSpellKnown(spellId))
        self:ApplyStyling()
        self:Show()
    end

    -- Setup cooldown
    button.cooldown = CreateFrame("Cooldown", "cooldown", button, "CooldownFrameTemplate")
    button.cooldown:SetDrawEdge(false)
    button.cooldown:SetAllPoints()

    function button:UpdateCooldown()
        local spellId = self:GetAttribute("spell")
        local _, durationGCD = GetSpellCooldown(61304) -- Dont handle GCD
        if not spellId or not IsSpellKnown(spellId) or durationGCD > 0 then return end

        local texture = self:GetNormalTexture()
        local start, duration = GetSpellCooldown(spellId)
        if duration > 0 then
            texture:SetDesaturated(true)
            self.cooldown:SetCooldown(start, duration)
        else
            texture:SetDesaturated(false)
        end
    end

    function button:SetCooldownEnabled(enabled)
        if enabled then
            self.cooldown:Show()
            self.notKnown:Hide()

            self:RegisterEvent("SPELL_UPDATE_COOLDOWN")
            self:UpdateCooldown()
            return
        end

        self.cooldown:Hide()
        self.notKnown:Show()

        self:UnregisterEvent("SPELL_UPDATE_COOLDOWN")
        local texture = self:GetNormalTexture()
        if texture then
            texture:SetDesaturated(false)
        end
    end

    button:SetScript("OnEvent", function(self) self:UpdateCooldown() end)
    button.cooldown:SetScript("OnCooldownDone", function(self) self:GetParent():UpdateCooldown() end)

    -- Setup tooltip
    function button:UpdateTooltip()
        local spellId = self:GetAttribute("spell")
        if not spellId or GameTooltip:GetOwner() ~= self then return end

        GameTooltip:SetSpellByID(spellId, nil, true)
    end

    function button:HideTooltip()
        if GameTooltip:GetOwner() ~= self then return end
        GameTooltip:Hide()
    end

    button:SetScript("OnLeave", function(self) self:HideTooltip() end)
    button:SetScript("OnEnter", function(self)
        -- GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT") -- Is top right somehow :shrug:
        self:UpdateTooltip()
    end)

    return button
end

function Library:ResetButton(button)
    button:SetAttribute("type", nil)
    button:SetAttribute("spell", nil)
    button:ClearAllPoints()

    button:SetCooldownEnabled(false)
    button:HideTooltip()
    button:Hide()
end

function Library:CreateSpellColumn(currentMapId, mapToSpellTable, showUnknown)
    if not mapToSpellTable[currentMapId] then return {} end

    local spells = {}
    for spellId in pairs(mapToSpellTable[currentMapId]) do
        if showUnknown or IsSpellKnown(spellId) then
            table.insert(spells, spellId)
        end
    end

    table.sort(spells, function(a, b)
        local nameA = GetSpellInfo(a)
        local nameB = GetSpellInfo(b)
        return nameA < nameB
    end)

    local buttons = {}
    local buttonSize = self.config.buttonSize
    for i, spellId in ipairs(spells) do
        local yOffset = -buttonSize * (i - 1)
        local button = self.buttonPool:Acquire()
        button:SetPoint("TOPLEFT", self.rootFrame, "TOPLEFT", 0, yOffset)
        button:ShowWithSpell(spellId)

        table.insert(buttons, button)
    end

    return buttons
end

function Library:ShiftColumn(buttons, xOffset)
    if #buttons == 0 then return false end

    for _, button in pairs(buttons) do
        button:AdjustPointsOffset(xOffset, 0)
    end
    return true
end

function Library:UpdateButtons()
    if not WorldMapFrame:IsVisible() then return end
    self.buttonPool:ReleaseAll()

    local currentMapId = WorldMapFrame:GetMapID()
    local xOffset = self.config.buttonSize
    local xOffsetCur = 0

    local instanceButtons = Library:CreateSpellColumn(currentMapId, self.INSTANCE_MAP_TO_SPELL, self.config.showUnknown)
    if Library:ShiftColumn(instanceButtons, xOffsetCur) then
        xOffsetCur = xOffsetCur + xOffset
    end

    if not self.config.mageOnly or (self.config.mageOnly and self.playerIsMage) then
        local mageButtons = Library:CreateSpellColumn(currentMapId, self.MAGE_MAP_TO_SPELL, self.config.mageShowUnknown)
        if Library:ShiftColumn(mageButtons, xOffsetCur) then
            xOffsetCur = xOffsetCur + xOffset
        end
    end

    if not self.config.druidOnly or (self.config.druidOnly and self.playerIsDruid) then
        local druidButtons = Library:CreateSpellColumn(currentMapId, self.DRUID_MAP_TO_SPELL, not self.playerIsDruid) -- Only show unkown if not druid
        if Library:ShiftColumn(druidButtons, xOffsetCur) then
            xOffsetCur = xOffsetCur + xOffset
        end
    end
end

function Library:UpdateButtonsStyling()
    if not WorldMapFrame:IsVisible() then return end

    for button in self.buttonPool:EnumerateActive() do
        button:ApplyStyling()
    end
end

function Library:Initialize()
    if not IsAddOnLoaded("Blizzard_WorldMap") then
        self:RegisterEvent("ADDON_LOADED")
        return
    end

    _G[LIBRARY_NAME] = self -- Allows to check if library exists on config update
    self.config = aura_env.config
    self.rootFrame = CreateFrame("Frame", LIBRARY_NAME .. " - RootFrame", WorldMapFrame.ScrollContainer)
    self.rootFrame:SetAllPoints()

    self.buttonPool = CreateObjectPool(
        function() return Library:CreateButton() end,
        function(_, button) Library:ResetButton(button) end
    )

    local _, _, classIndex = UnitClass("player");
    self.playerIsMage = classIndex == 8
    self.playerIsDruid = classIndex == 11

    hooksecurefunc(WorldMapFrame, "Show", function() Library:UpdateButtons() end);
    hooksecurefunc(WorldMapFrame, "OnMapChanged", function() Library:UpdateButtons() end);
    hooksecurefunc(WorldMapFrame, "OnFrameSizeChanged", function() Library:UpdateButtonsStyling() end);
    hooksecurefunc(WorldMapFrame, "Hide", function() Library.buttonPool:ReleaseAll() end);

    self:InitializeMapTables()
    self:UpdateButtons()
end

function Library:OnEvent(event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_WorldMap" then
            self:Initialize()
            self:UnregisterEvent("ADDON_LOADED")
        end
    end
end

Library:Initialize()
