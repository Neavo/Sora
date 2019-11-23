--------------------------------------- 聊天信息複製 Author:M-------------------------------------local CHAT_WHISPER_GET = CHAT_WHISPER_GET or "%s悄悄地說："local CHAT_WHISPER_INFORM_GET = CHAT_WHISPER_INFORM_GET or "發送給%s："--注意規則順序, button(LeftButton/RightButton)可以指定鼠標左右鍵使用不同的邏輯local rules = {    { pat = "|c%x+|HChatCopy|h.-|h|r",      repl = "" },   --去掉本插件定義的鏈接    { pat = "|c%x%x%x%x%x%x%x%x(.-)|r",     repl = "%1" }, --替換所有顔色值    { pat = CHAT_WHISPER_GET:gsub("%%s",".-"), repl = "", button = "LeftButton" }, --密語    { pat = CHAT_WHISPER_INFORM_GET:gsub("%%s",".-"), repl = "", button = "LeftButton" }, --密語    { pat = "|Hchannel:.-|h.-|h",           repl = "", button = "LeftButton" }, --(L)去掉頻道文字    { pat = "|Hplayer:.-|h.-|h" .. ":",     repl = "", button = "LeftButton" }, --(L)去掉發言玩家名字    { pat = "|Hplayer:.-|h.-|h" .. "：",    repl = "", button = "LeftButton" }, --(L)去掉發言玩家名字    { pat = "|HBNplayer:.-|h.-|h" .. ":",   repl = "", button = "LeftButton" }, --(L)去掉戰網發言玩家名字    { pat = "|HBNplayer:.-|h.-|h" .. "：",  repl = "", button = "LeftButton" }, --(L)去掉戰網發言玩家名字    { pat = "|Hchannel:.-|h(.-)|h",         repl = "%1", button = "RightButton" }, --(R)留下頻道文字    { pat = "|Hplayer:.-|h(.-)|h",          repl = "%1", button = "RightButton" }, --(R)留下發言玩家名字    { pat = "|HBNplayer:.-|h(.-)|h",        repl = "%1", button = "RightButton" }, --(R)留下戰網發言玩家名字    { pat = "|H.-|h(.-)|h",                 repl = "%1" },  --替換所有超連接    { pat = "|TInterface\\TargetingFrame\\UI%-RaidTargetingIcon_(%d):0|t", repl = "{rt%1}" },    { pat = "|T.-|t",                       repl = "" },    --替換所有素材    { pat = "|[rcTtHhkK]",                  repl = "" },    --去掉單獨的|r|c|K    { pat = "^%s+",                         repl = "" },    --去掉空格}--替換字符local function ClearMessage(msg, button)    for _, rule in ipairs(rules) do        if (not rule.button or rule.button == button) then            msg = msg:gsub(rule.pat, rule.repl)        end    end    return msgend--顯示信息local function ShowMessage(msg, button)    local editBox = ChatEdit_ChooseBoxForSend()    msg = ClearMessage(msg, button)    ChatEdit_ActivateChat(editBox)    editBox:SetText(editBox:GetText() .. msg)    editBox:HighlightText()end--獲取複製的信息local function GetMessage(...)    local object    for i = 1, select("#", ...) do        object = select(i, ...)        if (object:IsObjectType("FontString") and MouseIsOver(object)) then            return object:GetText()        end    end    return ""end--HACKlocal _SetItemRef = SetItemRefSetItemRef = function(link, text, button, chatFrame)    if (chatFrame and link:sub(1,8) == "ChatCopy") then        local msg = GetMessage(chatFrame.FontStringContainer:GetRegions())        return ShowMessage(msg, button)    end    _SetItemRef(link, text, button, chatFrame)endlocal function AddMessage(self, text, ...)    if (type(text) ~= "string") then        text = tostring(text)    end    text = format("|cff68ccef|HChatCopy|h%s|h|r %s", " +", text)    self.OrigAddMessage(self, text, ...)endlocal chatFramefor i = 1, NUM_CHAT_WINDOWS do    chatFrame = _G["ChatFrame" .. i]    if (chatFrame) then        chatFrame.OrigAddMessage = chatFrame.AddMessage        chatFrame.AddMessage = AddMessage    endend