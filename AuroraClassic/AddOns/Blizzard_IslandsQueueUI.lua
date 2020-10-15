local _, ns = ...
local F, C = unpack(ns)

C.themes["Blizzard_IslandsQueueUI"] = function()
	F.ReskinPortraitFrame(IslandsQueueFrame)
	IslandsQueueFrame.ArtOverlayFrame.PortraitFrame:SetAlpha(0)
	IslandsQueueFrame.ArtOverlayFrame.portrait:SetAlpha(0)
	F.Reskin(IslandsQueueFrame.DifficultySelectorFrame.QueueButton)
	IslandsQueueFrame.HelpButton.Ring:SetAlpha(0)

	local tutorial = IslandsQueueFrame.TutorialFrame
	F.ReskinClose(tutorial.CloseButton)
	local closeButton = tutorial:GetChildren()
	F.Reskin(closeButton)
	tutorial.TutorialText:SetTextColor(1, 1, 1)

	if F.ReskinTooltip then
		local tooltip = IslandsQueueFrameTooltip:GetParent()
		tooltip.IconBorder:SetAlpha(0)
		tooltip.Icon:SetTexCoord(unpack(C.TexCoord))
		F.ReskinTooltip(tooltip:GetParent())
	end
end