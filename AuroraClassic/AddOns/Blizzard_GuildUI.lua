local _, ns = ...
local F, C = unpack(ns)
local r, g, b = C.r, C.g, C.b

local function updateClassIcons()
	local index
	local offset = HybridScrollFrame_GetOffset(GuildRosterContainer)
	local totalMembers, _, onlineAndMobileMembers = GetNumGuildMembers()
	local visibleMembers = onlineAndMobileMembers
	local numbuttons = #GuildRosterContainer.buttons
	if GetGuildRosterShowOffline() then
		visibleMembers = totalMembers
	end

	for i = 1, numbuttons do
		local bu = GuildRosterContainer.buttons[i]

		if not bu.bg then
			bu:SetHighlightTexture(C.bdTex)
			bu:GetHighlightTexture():SetVertexColor(r, g, b, .2)

			bu.bg = F.CreateBDFrame(bu.icon)
		end

		index = offset + i
		local name, _, _, _, _, _, _, _, _, _, classFileName = GetGuildRosterInfo(index)
		if name and index <= visibleMembers and bu.icon:IsShown() then
			F.ClassIconTexCoord(bu.icon, classFileName)
			bu.bg:Show()
		else
			bu.bg:Hide()
		end
	end
end

local function updateLevelString(view)
	if view == "playerStatus" or view == "reputation" or view == "achievement" then
		local buttons = GuildRosterContainer.buttons
		for i = 1, #buttons do
			local str = _G["GuildRosterContainerButton"..i.."String1"]
			str:SetWidth(32)
			str:SetJustifyH("LEFT")
		end

		if view == "achievement" then
			for i = 1, #buttons do
				local str = _G["GuildRosterContainerButton"..i.."BarLabel"]
				str:SetWidth(60)
				str:SetJustifyH("LEFT")
			end
		end
	end
end

C.themes["Blizzard_GuildUI"] = function()
	F.ReskinPortraitFrame(GuildFrame)
	F.StripTextures(GuildMemberDetailFrame)
	F.SetBD(GuildMemberDetailFrame)
	GuildMemberNoteBackground:HideBackdrop()
	F.CreateBDFrame(GuildMemberNoteBackground, .25)
	GuildMemberOfficerNoteBackground:HideBackdrop()
	F.CreateBDFrame(GuildMemberOfficerNoteBackground, .25)
	F.SetBD(GuildLogFrame)
	F.CreateBDFrame(GuildLogContainer, .25)
	F.SetBD(GuildNewsFiltersFrame)
	F.SetBD(GuildTextEditFrame)
	F.StripTextures(GuildTextEditContainer)
	F.CreateBDFrame(GuildTextEditContainer, .25)
	for i = 1, 5 do
		F.ReskinTab(_G["GuildFrameTab"..i])
	end
	if GetLocale() == "zhTW" then
		GuildFrameTab1:ClearAllPoints()
		GuildFrameTab1:SetPoint("TOPLEFT", GuildFrame, "BOTTOMLEFT", -7, 2)
	end
	GuildFrameTabardBackground:Hide()
	GuildFrameTabardEmblem:Hide()
	GuildFrameTabardBorder:Hide()
	F.StripTextures(GuildInfoFrameInfo)
	F.StripTextures(GuildInfoFrameTab1)
	GuildMemberDetailCorner:Hide()
	F.StripTextures(GuildLogFrame)
	F.StripTextures(GuildLogContainer)
	F.StripTextures(GuildNewsFiltersFrame)
	F.StripTextures(GuildTextEditFrame)
	GuildAllPerksFrame:GetRegions():Hide()
	GuildNewsFrame:GetRegions():Hide()
	GuildRewardsFrame:GetRegions():Hide()
	GuildNewsBossModelShadowOverlay:Hide()
	GuildNewsFrameHeader:SetAlpha(0)

	GuildFrameBottomInset:DisableDrawLayer("BACKGROUND")
	GuildFrameBottomInset:DisableDrawLayer("BORDER")
	GuildInfoFrameInfoBar1Left:SetAlpha(0)
	GuildInfoFrameInfoBar2Left:SetAlpha(0)
	for i = 1, 4 do
		_G["GuildRosterColumnButton"..i]:DisableDrawLayer("BACKGROUND")
	end
	GuildNewsBossModel:DisableDrawLayer("BACKGROUND")
	GuildNewsBossModel:DisableDrawLayer("OVERLAY")
	GuildNewsBossNameText:SetDrawLayer("ARTWORK")
	F.StripTextures(GuildNewsBossModelTextFrame)

	GuildMemberRankDropdown:HookScript("OnShow", function()
		GuildMemberDetailRankText:Hide()
	end)
	GuildMemberRankDropdown:HookScript("OnHide", function()
		GuildMemberDetailRankText:Show()
	end)

	hooksecurefunc("GuildNews_Update", function()
		local buttons = GuildNewsContainer.buttons
		for i = 1, #buttons do
			buttons[i].header:SetAlpha(0)
		end
	end)

	F.ReskinClose(GuildNewsFiltersFrameCloseButton)
	F.ReskinClose(GuildLogFrameCloseButton)
	F.ReskinClose(GuildMemberDetailCloseButton)
	F.ReskinClose(GuildTextEditFrameCloseButton)
	F.ReskinScroll(GuildPerksContainerScrollBar)
	F.ReskinScroll(GuildRosterContainerScrollBar)
	F.ReskinScroll(GuildNewsContainerScrollBar)
	F.ReskinScroll(GuildRewardsContainerScrollBar)
	F.ReskinScroll(GuildInfoFrameInfoMOTDScrollFrameScrollBar)
	F.ReskinScroll(GuildInfoDetailsFrameScrollBar)
	F.ReskinScroll(GuildLogScrollFrameScrollBar)
	F.ReskinScroll(GuildTextEditScrollFrameScrollBar)
	F.ReskinDropDown(GuildRosterViewDropdown)
	F.ReskinDropDown(GuildMemberRankDropdown)

	F.ReskinCheck(GuildRosterShowOfflineButton)
	for i = 1, 7 do
		F.ReskinCheck(GuildNewsFiltersFrame.GuildNewsFilterButtons[i])
	end

	local a1, p, a2, x, y = GuildNewsBossModel:GetPoint()
	GuildNewsBossModel:ClearAllPoints()
	GuildNewsBossModel:SetPoint(a1, p, a2, x + 7, y)

	local f = F.SetBD(GuildNewsBossModel)
	f:SetPoint("BOTTOMRIGHT", 2, -52)

	GuildNewsFiltersFrame:SetWidth(224)
	GuildNewsFiltersFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, -20)
	GuildMemberDetailFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, -28)
	GuildLogFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)
	GuildTextEditFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 3, 0)

	GuildFactionBarProgress:SetTexture(C.bdTex)
	GuildFactionBarLeft:Hide()
	GuildFactionBarMiddle:Hide()
	GuildFactionBarRight:Hide()
	GuildFactionBarShadow:SetAlpha(0)
	GuildFactionBarBG:Hide()
	GuildFactionBarCap:SetAlpha(0)
	local bg = F.CreateBDFrame(GuildFactionFrame, .25)
	bg:SetPoint("TOPLEFT", GuildFactionFrame, -1, -1)
	bg:SetPoint("BOTTOMRIGHT", GuildFactionFrame, -3, 0)
	bg:SetFrameLevel(0)

	for _, button in pairs(GuildPerksContainer.buttons) do
		F.ReskinIcon(button.icon)
		F.StripTextures(button)
		button.bg = F.CreateBDFrame(button, .25)
		button.bg:ClearAllPoints()
		button.bg:SetPoint("TOPLEFT", button.icon, 0, C.mult)
		button.bg:SetPoint("BOTTOMLEFT", button.icon, 0, -C.mult)
		button.bg:SetWidth(button:GetWidth())
	end
	GuildPerksContainerButton1:SetPoint("LEFT", -1, 0)

	hooksecurefunc("GuildRewards_Update", function()
		local buttons = GuildRewardsContainer.buttons
		for i = 1, #buttons do
			local bu = buttons[i]
			if not bu.bg then
				bu:SetNormalTexture("")
				bu:SetHighlightTexture("")
				F.ReskinIcon(bu.icon)
				bu.disabledBG:Hide()
				bu.disabledBG.Show = F.Dummy

				bu.bg = F.CreateBDFrame(bu, .25)
				bu.bg:ClearAllPoints()
				bu.bg:SetPoint("TOPLEFT", 1, -1)
				bu.bg:SetPoint("BOTTOMRIGHT", 0, 0)
			end
		end
	end)

	hooksecurefunc("GuildRoster_Update", updateClassIcons)
	hooksecurefunc(GuildRosterContainer, "update", updateClassIcons)

	F.Reskin(select(4, GuildTextEditFrame:GetChildren()))
	F.Reskin(select(3, GuildLogFrame:GetChildren()))

	local gbuttons = {
		"GuildAddMemberButton",
		"GuildViewLogButton",
		"GuildControlButton",
		"GuildTextEditFrameAcceptButton",
		"GuildMemberGroupInviteButton",
		"GuildMemberRemoveButton",
	}
	for i = 1, #gbuttons do
		F.Reskin(_G[gbuttons[i]])
	end

	-- Tradeskill View
	hooksecurefunc("GuildRoster_UpdateTradeSkills", function()
		local buttons = GuildRosterContainer.buttons
		for i = 1, #buttons do
			local index = HybridScrollFrame_GetOffset(GuildRosterContainer) + i
			local str = _G["GuildRosterContainerButton"..i.."String1"]
			local header = _G["GuildRosterContainerButton"..i.."HeaderButton"]
			if header then
				local _, _, _, headerName = GetGuildTradeSkillInfo(index)
				if headerName then
					str:Hide()
				else
					str:Show()
				end

				if not header.bg then
					F.StripTextures(header, 5)
					header.bg = F.CreateBDFrame(header, .25)
					header.bg:SetAllPoints()

					header:SetHighlightTexture(C.bdTex)
					local hl = header:GetHighlightTexture()
					hl:SetVertexColor(r, g, b, .25)
					hl:SetInside()
				end
			end
		end
	end)

	-- Font width fix
	local done
	GuildRosterContainer:HookScript("OnShow", function()
		if not done then
			updateLevelString(GetCVar("guildRosterView"))
			done = true
		end
	end)
	hooksecurefunc("GuildRoster_SetView", updateLevelString)
end