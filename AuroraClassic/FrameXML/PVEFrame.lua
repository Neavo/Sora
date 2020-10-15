local _, ns = ...
local F, C = unpack(ns)

tinsert(C.defaultThemes, function()
	local r, g, b = C.r, C.g, C.b

	PVEFrameLeftInset:SetAlpha(0)
	PVEFrameBlueBg:SetAlpha(0)
	PVEFrame.shadows:SetAlpha(0)

	PVEFrameTab2:SetPoint("LEFT", PVEFrameTab1, "RIGHT", -15, 0)
	PVEFrameTab3:SetPoint("LEFT", PVEFrameTab2, "RIGHT", -15, 0)

	GroupFinderFrameGroupButton1.icon:SetTexture("Interface\\Icons\\INV_Helmet_08")
	GroupFinderFrameGroupButton2.icon:SetTexture("Interface\\Icons\\Icon_Scenarios")
	GroupFinderFrameGroupButton3.icon:SetTexture("Interface\\Icons\\inv_helmet_06")

	local iconSize = 60-2*C.mult
	for i = 1, 3 do
		local bu = GroupFinderFrame["groupButton"..i]

		bu.ring:Hide()
		F.Reskin(bu, true)
		bu.bg:SetTexture(C.bdTex)
		bu.bg:SetVertexColor(r, g, b, .2)
		bu.bg:SetInside(bu.__bg)

		bu.icon:SetPoint("LEFT", bu, "LEFT")
		bu.icon:SetSize(iconSize, iconSize)
		F.ReskinIcon(bu.icon)
	end

	hooksecurefunc("GroupFinderFrame_SelectGroupButton", function(index)
		local self = GroupFinderFrame
		for i = 1, 3 do
			local button = self["groupButton"..i]
			if i == index then
				button.bg:Show()
			else
				button.bg:Hide()
			end
		end
	end)

	F.ReskinPortraitFrame(PVEFrame)
	F.ReskinTab(PVEFrameTab1)
	F.ReskinTab(PVEFrameTab2)
	F.ReskinTab(PVEFrameTab3)
end)