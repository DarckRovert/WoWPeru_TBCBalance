-- Diagnostic display only: no spell, combat or buff API is modified.
local indicator = CreateFrame("Button", "ProjectJaina_TBCBalanceIndicator", UIParent)
indicator:SetSize(36, 36)
indicator:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -220, -165)
indicator:SetFrameStrata("MEDIUM")
indicator:Hide()
local icon = indicator:CreateTexture(nil, "BACKGROUND")
icon:SetAllPoints()
icon:SetTexture("Interface\\Icons\\Spell_Shadow_SealOfKings")
local border = indicator:CreateTexture(nil, "OVERLAY")
border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
border:SetVertexColor(1, 0.7, 0.1)
border:SetPoint("TOPLEFT", -2, 2)
border:SetPoint("BOTTOMRIGHT", 2, -2)
local label = indicator:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
label:SetPoint("TOP", indicator, "BOTTOM", 0, -3)
label:SetText("TBC -40%")
indicator:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("Equilibrio de bandas TBC - Inti", 1, 0.82, 0)
    GameTooltip:AddLine("Daño infligido: -40%", 1, 1, 1)
    GameTooltip:AddLine("Sanación realizada: -40%", 1, 1, 1)
    GameTooltip:AddLine("También afecta a mascotas e invocaciones.", 0.8, 0.8, 0.8)
    GameTooltip:AddLine("Visible solo para ti con .gm on.", 0.4, 1, 0.4)
    GameTooltip:AddLine("Aura 950040 | .tbcscale status", 0.7, 0.7, 0.7)
    GameTooltip:Show()
end)
indicator:SetScript("OnLeave", function() GameTooltip:Hide() end)
indicator:SetScript("OnHide", function(self)
    if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
end)
local expires = 0
local events = CreateFrame("Frame")
events:RegisterEvent("CHAT_MSG_ADDON")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("PLAYER_LEAVING_WORLD")
events:SetScript("OnEvent", function(_, event, prefix, message, channel, sender)
    if event ~= "CHAT_MSG_ADDON" then indicator:Hide(); expires = 0; return end
    if prefix ~= "INTITBC" or channel ~= "WHISPER" then return end
    -- Exact self-origin: another character cannot make the GM display appear.
    local name, realm = UnitName("player"), GetRealmName()
    if sender ~= name and sender ~= name .. "-" .. realm:gsub("%s", "") then return end
    if not realm:lower():find("inti", 1, true) then return end
    if message == "1;40;950040" then
        expires = GetTime() + 4
        indicator:Show()
    elseif message == "0" then
        expires = 0
        indicator:Hide()
    end
end)
events:SetScript("OnUpdate", function()
    if expires > 0 and GetTime() > expires then expires = 0; indicator:Hide() end
end)
