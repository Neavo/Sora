local _, ns = ...
local _, C = unpack(ns)

-- 法术白名单
C.WhiteList = {
	-- Buffs
	[642]		= true,		-- 圣盾术
	[1022]		= true,		-- 保护之手
	[23920]		= true,		-- 法术反射
	[45438]		= true,		-- 寒冰屏障
	[186265]	= true,		-- 灵龟守护
	-- Debuffs
	[2094]		= true,		-- 致盲
	[117405]	= true,		-- 束缚射击
	[127797]	= true,		-- 乌索尔旋风
	[20549] 	= true,		-- 战争践踏
	[107079] 	= true,		-- 震山掌
	[272295] 	= true,		-- 悬赏
	-- Dungeons
	[283640]	= true,		-- 仁慈侏儒短路，麦卡贡
	[293724]	= true,		-- 护盾发生器
	[298602]	= true,		-- 烟云

	[258317]	= true,		-- 防爆盾，托尔达戈
	[257899]	= true,		-- 痛苦激励，自由镇
	[268008]	= true,		-- 毒蛇诱惑，神庙
	[260792]	= true,		-- 尘土云，神庙
	[260416]	= true,		-- 蜕变，孢林
	[267981]	= true,		-- 防护光环，风暴神殿
	[274631]	= true,		-- 次级铁墙祝福，风暴神殿
	[267901]	= true,		-- 铁墙祝福，风暴神殿
	[276767]	= true,		-- 吞噬虚空，风暴神殿
	[268212]	= true,		-- 小型强化结界，风暴神殿
	[268186]	= true,		-- 强化结界，风暴神殿
	[263246]	= true,		-- 闪电之盾，风暴神殿
	[263276]	= true,		-- 掩护，矿区
	[257597]	= true,		-- 艾泽里特的灌注，矿区
	[269302]	= true,		-- 淬毒之刃，矿区
	[260805]	= true,		-- 聚焦之虹，庄园
	[264027]	= true,		-- 结界蜡烛，庄园
	[258653]	= true,		-- 魂能壁垒，阿塔达萨
	[255960]	= true,		-- 强效巫毒，阿塔达萨
	[255967]	= true,
	[255968]	= true,
	[255970]	= true,
	[255972]	= true,
	[228318]	= true,		-- 激怒
	[226510]	= true,		-- 血池
	[277242]	= true,		-- 共生
	[290026]	= true,		-- 女王法令：反冲
	[290027]	= true,
	[302418]	= true,		-- 女王法令：势不可挡
	[302419]	= true,		-- 虚空视界
	[302421]	= true,		-- 女王法令：隐藏
	-- Raids
	[296389]	= true,		-- 上旋气流，艾萨拉之辉
	[296650]	= true,		-- 硬化甲壳，艾什凡女勋爵
	[296914]	= true,		-- 混乱生长，奥戈佐亚
	[282209]	= true,		-- 掠食印记
	[296704]	= true,		-- 权力制衡，女王法庭
	[295099]	= true,		-- 穿透黑暗，扎库尔
	[300428]	= true,		-- 激怒，艾萨拉
	[297912]	= true,		-- 饱受煎熬
	[300551]	= true,		-- 力量结界

	[287693]	= true,		-- 隐性联结，乌纳特
	[282741]	= true,		-- 暗影之壳
	[285333]	= true,		-- 非自然再生
	[285642]	= true,		-- 恩佐斯之赐：癔乱

	[283619]	= true,		-- 圣光之潮，圣光勇士
	[284468]	= true,		-- 惩戒光环
	[283933]	= true,		-- 正义审判
	[284593]	= true,		-- 苦修
	[283583]	= true,		-- 奉献
	[288294]	= true,		-- 圣佑术
	[288298]	= true,		-- 自律
	[287469]	= true,		-- 殒落祷告
	[287439]	= true,		-- 神圣之锤
	[286436]	= true,		-- 翡翠风暴，玉火大师
	[286425]	= true,		-- 火焰护盾
	[287652]	= true,		-- 过载，丰灵
	[282098]	= true,		-- 风之恩赐，神选者教团
	[287650]	= true,		-- 沸腾之怒
	[282736]	= true,		-- 神灵的愤怒
	[285945]	= true,		-- 急速之风
	[286007]	= true,		-- 龙群猎手
	[289162]	= true,		-- 无情不朽，拉斯卡哈大王
	[288117]	= true,		-- 灌魔之灵
	[287297]	= true,		-- 上满发条，大工匠
	[286558]	= true,		-- 潮汐遮罩，风暴之墙
	[287995]	= true,		-- 电流护罩
	[284997]	= true,		-- 覆藻之拳
	[287322]	= true,		-- 寒冰屏障，吉安娜

	[276093]	= true,		-- 血色镜像，祖尔
	[276299]	= true,		-- 充血爆发，祖尔
	[276434]	= true,		-- 腐烂血肉，祖尔
	[276900]	= true,		-- 临界炽焰，拆解者米斯拉克斯
	[263482]	= true,		-- 重组冲击，戈霍恩
	[263284]	= true,		-- 鲜血之力，戈霍恩
	[268074]	= true,		-- 黑暗意图，戈霍恩
	[275204]	= true,		-- 不可阻挡的腐化，戈霍恩

	[207327]	= true,		-- 净化毁灭，崔利艾克斯
	[236513]	= true,		-- 骨牢护甲，聚合体小怪
	[240315]	= true,		-- 硬化之壳，哈亚坦蛋盾
	[241521]	= true,		-- 折磨碎片，M审判庭小怪
	[250074]	= true,		-- 净化，艾欧娜尔
	[250555]	= true,		-- 邪能护盾，艾欧娜尔
	[246504]	= true,		-- 程式启动，金加洛斯
	[249863]	= true,		-- 泰坦的面容，破坏魔女巫会
	[244903]	= true,		-- 催化作用，阿格拉玛
	[247091]	= true,		-- 催化，阿格拉玛
	[253021]	= true,		-- 宿命，寂灭者阿古斯
	[255496]	= true,		-- 宇宙之剑，寂灭者阿古斯
	[255478]	= true,		-- 永恒之刃，寂灭者阿古斯
	[255418]	= true,		-- 物理易伤，寂灭者阿古斯
	[255425]	= true,		-- 冰霜易伤，寂灭者阿古斯
	[255430]	= true,		-- 暗影易伤，寂灭者阿古斯
	[255429]	= true,		-- 火焰易伤，寂灭者阿古斯
	[255419]	= true,		-- 神圣易伤，寂灭者阿古斯
	[255422]	= true,		-- 自然易伤，寂灭者阿古斯
	[255433]	= true,		-- 奥术易伤，寂灭者阿古斯
}

-- 法术黑名单
C.BlackList = {
	[15407]		= true,		-- 精神鞭笞
	[1490]		= true,		-- 混乱烙印
	[113746]	= true,		-- 玄秘掌
	[51714]		= true,		-- 锋锐之霜
	[199721]	= true,		-- 腐烂光环
	[214968]	= true,		-- 死灵光环
	[214975]	= true,		-- 抑心光环
	[273977]	= true,		-- 亡者之握
	[276919]	= true,		-- 承受压力
	[206930]	= true,		-- 心脏打击
}

-- 取自地城手册的段落ID
-- 纯数字则为GUID，选择目标后输入/getnpc获取
local function GetSectionInfo(id)
	return C_EncounterJournal.GetSectionInfo(id).title
end

-- 特殊单位的染色列表
C.CustomUnits = {
	[120651] = true, -- 爆炸物
	[141851] = true, -- 戈霍恩之嗣
	[153377] = true, -- 粘液，麦卡贡
	[155432] = true, -- 魔力使者
	[155433] = true, -- 虚触使者
	[155434] = true, -- 潮汐使者

	[GetSectionInfo(14544)] = true,	-- 海拉加尔观雾者
	[GetSectionInfo(14595)] = true,	-- 深渊追猎者
	[GetSectionInfo(16588)] = true,	-- 尖啸反舌鸟
	[GetSectionInfo(16350)] = true,	-- 瓦里玛萨斯之影

	[GetSectionInfo(18540)] = true,	-- 纳兹曼尼鲜血妖术师
	[GetSectionInfo(18104)] = true,	-- 散疫触须
	[GetSectionInfo(18232)] = true,	-- 艾什凡炮手
	[GetSectionInfo(18499)] = true,	-- 凝结之血
	[GetSectionInfo(18078)] = true,	-- 蛛魔编织者
	[GetSectionInfo(18007)] = true,	-- 瘟疫聚合体
	[GetSectionInfo(18053)] = true,	-- 灵魂荆棘
	[GetSectionInfo(18312)] = true,	-- 血面兽
	[GetSectionInfo(18890)] = true,	-- 夏尔扎克斯
	[GetSectionInfo(18321)] = true,	-- 缠绕的蛇群
	[GetSectionInfo(18271)] = true,	-- 爆裂图腾
	[GetSectionInfo(17026)] = true,	-- 眩晕酒桶
	[GetSectionInfo(19656)] = true,	-- 僵尸尘图腾
	[GetSectionInfo(19393)] = true,	-- 雪怒之魂
	[GetSectionInfo(19279)] = true,	-- 谄媚海妖
	[GetSectionInfo(19019)] = true,	-- 贪婪的追猎者
}

-- 显示能量值的单位
C.ShowPowerList = {
	[155432] = true, -- 魔力使者
	[152703] = true, -- 步行震击者X1型，困难麦卡贡
	[GetSectionInfo(13015)] = true,	-- 清扫器
	[GetSectionInfo(15903)] = true,	-- 泰沙拉克的余烬
	[GetSectionInfo(18540)] = true,	-- 纳兹曼尼鲜血妖术师
	[GetSectionInfo(18539)] = true,	-- 碾压者
}