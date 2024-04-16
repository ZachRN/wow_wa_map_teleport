local LIBRARY_NAME = "Zach's and Eathox's Dungeon Teleport Buttons"
local Library = _G[LIBRARY_NAME]
-- https://wowpedia.fandom.com/wiki/UiMapID

if Library then -- Config updated, update buttons
    Library.config = aura_env.config
    Library:UpdateButtons()
    return
end

Library = {}
Library.INSTANCE_SPELL_TO_MAP = {
    -- Cataclysm
    [410080] = { 249 }, -- The Vortex Pinnacle, Uldum
    [424142] = { 204 }, -- Throne of the Tides, Abyssal Depths

    -- Pandaria
    [131204] = { 371 }, -- Temple of the Jade Serpent, The Jade Forest
    [131205] = { 376 }, -- Stormstout Brewery, Valley of the Four Winds
    [131225] = { 422 }, -- Gate of the Setting Sun, Dread Wastes
    [131206] = { 379 }, -- Shado-Pan Monastery, Kun-Lai Summit
    [131228] = { 388 }, -- Siege of Niuzao Temple, Townlong Steppes
    [131222] = { 390 }, -- Mogu'shan Palace, Vale of Eternal Blossoms
    [131232] = { 22 },  -- Scholomance, Western Plaguelands - Maybe 1249 for WPL?
    [131231] = { 18 },  -- Scarlet Halls, Tirisfal Glades - Maybe 997/1247/2070?
    [131229] = { 18 },  -- Scarlet Monastery, Tirisfal Glades - Maybe 997/1247/2070?

    -- Warlords of Draenor
    [159898] = { 542 }, -- Skyreach, Spires of Arak
    [159895] = { 525 }, -- Bloodmaul Slag Mines, Frostfire Ridge
    [159897] = { 535 }, -- Auchindoun, Talador
    [159899] = { 534 }, -- Shadowmoon Burial Grounds, Tanaan Jungle
    [159900] = { 543 }, -- Grimrail Depot, Gorgrond
    [159902] = { 32 },  -- Upper Blackrock Spire, Searing Gorge - Maybe 1254
    [159901] = { 543 }, -- The Everbloom, Gorgrond
    [159896] = { 543 }, -- Iron Docks, Gorgrond

    -- Legion
    [424163] = { 641 }, -- Darkheart Thicket, Val'sharah
    [424153] = { 641 }, -- Black Rook Hold, Val'sharah
    [393764] = { 634 }, -- Halls of Valor, Stormheim
    [410078] = { 650 }, -- Neltharion's Lair, Highmountain
    [393766] = { 680 }, -- Court of Stars, Suramar
    [373262] = { 42 },  -- Karazhan, Deadwind pass - Maybe 1257?
    -- [] = { 630 }, -- Eye of Azshara, Azsuna
    -- [] = { 630 }, -- Vault of the Wardens, Azsuna
    -- [] = { 680 }, -- The Arcway, Suramar
    -- [] = { 646 }, -- Cathedral of Eternal Night, Broken Shore
    -- [] = { 882 }, -- The Seat of the Triumvirate, Eredath
    -- [] = { 125 }, -- Violet Hold, Dalaran
    -- [] = {},      -- Maw of Souls?

    -- Battle for Azeroth
    [424187] = { 862 },  -- Atal'Dazar, Zuldazar
    [410071] = { 895 },  -- Freehold, Tiragarde Sound
    [424167] = { 896 },  -- Waycrest Manor, Drustvar
    [410074] = { 863 },  -- The Underrot, Nazmir
    [373274] = { 1462 }, -- Operation Mechagon, Mechagon Island
    -- [] = { 895 }, -- Tol Dagor, Tiragarde Sound
    -- [] = { 194 }, -- The MOTHERLODE!!, Kezan
    -- [] = { 862 }, -- Kings' Rest, Zuldazar
    -- [] = { 1195 }, -- Temple of Sethraliss, Vol'dun
    -- [] = { 942 }, -- Shrine of the Storm, Stormsong Valley
    -- [] = { 895 }, -- Siege of Boralus, Tiragarde Sound


    -- Shadowlands
    [354464] = { 1565 }, -- Mists of Tirna Scithe, Ardenweald
    [354462] = { 1533 }, -- The Necrotic Wake, Bastion
    [354468] = { 1565 }, -- De Other Side, Ardenweald
    [354465] = { 1525 }, -- Halls of Atonement, Revendreath
    [354463] = { 1536 }, -- Plaguefall, Maldraxxus
    [354469] = { 1525 }, -- Sanguine Depths, Revendreath
    [354466] = { 1533 }, -- Spires of Ascension, Bastion
    [354467] = { 1536 }, -- Theater of Pain, Maldraxxus
    [367416] = { 1670 }, -- Tazavesh the Veiled Market, Oribos

    -- Dragonflight
    [393256] = { 2022 }, -- Ruby Life Pools, The Waking Shores
    [393262] = { 2023 }, -- The Nokhud Offensive, Ohn'ahran Plains
    [393279] = { 2024 }, -- The Azure Vault, The Azure Span
    [393273] = { 2025 }, -- Algeth'ar Academy, Thaldraszus
    [393222] = { 15 },   -- Uldaman: Legacy of Tyr, Badlands - Maybe 1245?
    [393276] = { 2022 }, -- Neltharus, The Waking Shores
    [393267] = { 2024 }, -- Brackenhide Hollow, The Azure Span
    [393283] = { 2025 }, -- Halls of Infusion, Thaldraszus
    [424197] = { 2025 }, -- Dawn of the Inifine, Thaldraszus
}
Library.MAGE_SPELL_TO_MAP = {
    -- Alliance
    [11416] = { 87, 27 },     -- Ironforge & Dun Morogh
    [10059] = { 84, 37 },     -- Stormwind && Elwyrnn Forest
    [11419] = { 89, 57 },     -- Darnassus && Teldrassil
    [32266] = { 103, 97 },    -- Exodar && Azuremyst Isle
    [49360] = { 70 },         -- Theramore (Dustwallow March)
    [176246] = { 622, 588 },  -- Stormshield && Ashran
    [267877] = { 1161, 895 }, -- Boralus && Tiragarde Sound

    -- Horde
    [11417] = { 85, 1 },      -- Orgrimmar && Durotar
    [11418] = { 90, 18 },     -- Undercity && Tirisfal Glade
    [11420] = { 88, 7 },      -- Thunderbluff && Mulgore
    [32267] = { 110, 94 },    -- Silvermoon && Eversoong Woods
    [49361] = { 51 },         -- Stonard (Swamp of Sorrows)
    [176244] = { 624, 588 },  -- Warspear && Ashran
    [281402] = { 1165, 862 }, -- Dazar'alor && Zuldazar

    -- Neutral
    [33691] = { 111, 108 },    -- Shattrath && Terokkar Forest
    [53142] = { 125, 127 },    -- Dalaran - Northrend && Crystalsong Forest
    [132620] = { 390 },        -- Vale of Eternal Blossoms ALLIANCE
    [132626] = { 390 },        -- Vale of Eternal Blossoms HORDE
    [88345] = { 244 },         -- Tol Barad ALLIANCE
    [88346] = { 244 },         -- Tol Barad HORDE
    [120146] = { 25 },         -- Dalaran Crater
    [224871] = { 627, 619 },   -- Dalaran - Broken Isles && Legion Main Map
    [344597] = { 1670, 1550 }, -- Oribos && The Shadowlands
    [395289] = { 2112, 2025 }, -- Valdrakken
}
Library.DRUID_SPELL_TO_MAP = {
    [193753] = { 2239, 747, 641, 69, 116, 198, 47, 26, 80 }, -- Dreamwalk.
    [18960] = { 80 },                                        -- MOOOOOOOOOOOOOOOOONGLADE BABY
}

function Library:CreateButton()
    local button = CreateFrame("Button", nil, Library.rootFrame, "InSecureActionButtonTemplate")
    button:RegisterForClicks("AnyDown", "AnyUp")

    -- Black 60% opacity overlay
    button.notKnown = button:CreateTexture(nil, "OVERLAY")
    button.notKnown:SetAllPoints()
    button.notKnown:SetColorTexture(0, 0, 0, 0.6)

    function button:ApplyStyling()
        self:SetSize(Library.config.buttonSize, Library.config.buttonSize)

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

function Library:CreateSpellCollumn(currentMapId, spellToMapTable, showUnknown)
    local spells = {}
    for spellId, locations in pairs(spellToMapTable) do
        if showUnknown or IsSpellKnown(spellId) then
            for _, location in ipairs(locations) do
                if location == currentMapId then
                    table.insert(spells, spellId)
                end
            end
        end
    end

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

function Library:ShiftCollumn(buttons, xOffset)
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

    local instanceButtons = self:CreateSpellCollumn(currentMapId, self.INSTANCE_SPELL_TO_MAP, self.config.showUnknown)
    if self:ShiftCollumn(instanceButtons, xOffsetCur) then
        xOffsetCur = xOffsetCur + xOffset
    end

    if not self.config.mageOnly or (self.config.mageOnly and self.playerIsMage) then
        local mageButtons = self:CreateSpellCollumn(currentMapId, self.MAGE_SPELL_TO_MAP, self.config.mageShowUnknown)
        if self:ShiftCollumn(mageButtons, xOffsetCur) then
            xOffsetCur = xOffsetCur + xOffset
        end
    end

    if not self.config.druidOnly or (self.config.druidOnly and self.playerIsDruid) then
        local druidButtons = self:CreateSpellCollumn(currentMapId, self.DRUID_SPELL_TO_MAP, not self.playerIsDruid) -- Only show unkown if not druid
        if self:ShiftCollumn(druidButtons, xOffsetCur) then
            xOffsetCur = xOffsetCur + xOffset
        end
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
    self.buttonPool:SetResetDisallowedIfNew(true)

    local _, _, classIndex = UnitClass("player");
    self.playerIsMage = classIndex == 8
    self.playerIsDruid = classIndex == 11

    hooksecurefunc(WorldMapFrame, "Show", function() Library:UpdateButtons() end);
    hooksecurefunc(WorldMapFrame, "OnMapChanged", function() Library:UpdateButtons() end);
    hooksecurefunc(WorldMapFrame, "Hide", function() Library.buttonPool:ReleaseAll() end);

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
