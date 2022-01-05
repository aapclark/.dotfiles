local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local basil = {
	"                                                                                   ",
	"                                                                                   ",
	"                                                   :o++/:.`                        ",
	"                                                   -/hhhhho+.                      ",
	"                                                   :hddhyyhhs:                     ",
	"                                                   -hhdhhhyyhh/`                   ",
	"                                                    :yhhhhsshyhs.                  ",
	"                          ./+//:-.``                `/hhdmyhydddy`                 ",
	"                  ``..-:://yhddddyo+:`               :yhddyysyydd/                 ",
	"              `-+ossssyyhdosdmmmmmmdhs/.             /hhdmddsyydsy                 ",
	"           `-+syyysyhhhdhhsohmmdmmmmmmdy:.           ohddmdddhddhh`                ",
	"         `/syhhyoyhhhhhddhsyhmmdhhdmmmmmds+.         +hdddddmmdddh`                ",
	"       ./oyhyhhhhddhdhhhdhyohdmmmmhhmmmmmmdh/```     .hdddddmdydmy                 ",
	"     `:shhhhyhhdddddhdhhhhhoydmmmmmdhmmmmmdyys+/--    /hddmdhdsodo                 ",
	"    :ohhhhdhyhhdddddhhhhhhyyohdmmmmmddmmmmmmhsyyso/-`  +dmmdddhds/                 ",
	"   :hdhhhdddhhhdddyyhddhdhyhoyhmmmmmmddmmmmmmdyhyyoso` `omddddyhh:                 ",
	"  .yhhdhhddmdhhddhhhhdddddyys+ydmmmmmdymmmmmmmmhssy+os:``hdhddhsh:                 ",
	" .ohyddyydhdhdhdyhdddddddddyossydmmmdddydmmmmmmmdoso+/s/-smyyddhd-                 ",
	" /hhyhhyddhhydhdydhddddhddhyyssssyyhhyhyyhdmdmmmmosoo++ooomydddmh.                 ",
	" /hysyhysdhhyhhdhddhhhddddhhyyddhsysoyyhhyhysyydmysoho+/o+dhddddho                 ",
	" -hdddssydhdhhdhdddhddhhddydhdddhsysososhyhdhhyyyhoshhhyshhdddmdhy/                ",
	" shdyydsyshddhhdhddddmdhyhdddhdddhdhhyyooo+hddsyyyyyhhhmshhhhdhhdhd+.              ",
	" +ddhssydsydddhdddddddddddmmddhddddddhysoooosyhhhdhhhhhdydhhdh+yyshmd+`            ",
	" :dhdhyshshyyhdhddddddddddmmdddddddddyyyosysooossyddhhdoydhhdddhhooshhy-           ",
	" .hdhdhdssssddddhddddddmdmmmmdddddysyyysyddysossy/shdddoddydddddmdhyhdhhy+.        ",
	" .shhhhhhshyyysshhdddddmdddmmdddddysydyhhdhdhhhhyooyddhhdddddddmdmmmddyyydh+       ",
	" `shdhddhshhddddssyhhdddmmmddhhhddddsyddhhhhdhyyyyyoyhdhhdyyyyhdmmmmdmhsdhhh+`     ",
	"  sdhhhhhsyyhddddhhhssdhhddddyyhhdddddddddhhhhysyhhhshdhhh+.:.-smNNmmmmddmdhy.     ",
	"  :shhhssyssoyddddhhohddddyhhddhhdddddddddddhs+hhyyhhdddhsy-.``:hmNNmmmmymhhy+:    ",
	" ``syhdhsosysshddyshddddhddhhhddddddhhhddddys+ohhhyyyhhhhhhyo+++dmNmNmmmmmdhyso.   ",
	"  .yhhhddhysoyshhhdhddhhyyyyyhhhhsdddddhhhdysoshhyyoyyhhhdhdhdddddddmmmmmddhhh+/   ",
	"  -yhddhddhsssshhhhddhdhhhyhsysoyhdmdddddyhys+ohyhhosyyyhddddddddysshdmNmddhdy+/   ",
	"  -shysdddhsosssyyshdhhddhhhdhssydhdmmdddhhyssssyyhhysyyyyddddddddysshdhdmhddhy:   ",
	"  `:yhohddddyososyyysyhhhdhyhsyshhhdddddddhyhyoosyhhssyyyshhdddddmmhsshhdhdhhhho`` ",
	"    -//+yhhddhyssyyyyysyhhhsoyhoyyyyddddddddddssosshysshhhdhhhhdddddhhhddyhhhyhh:` ",
	"     `.:+ohhhhhyysyyyyyoyhhhyyoyssdyydhhhhhhhyoysososhyhhhddhhhhhyysoosddhysyyys-  ",
	"        `.oyhhhhhyyyyosssysoyyss+shhyshhhyhhdhyssosooossyyhhhhhyysso//osyysyys-`   ",
	"         `.++syhhhhyssyoooosossssoyhyyyhhyhdddyyysososoo++sosyyyyy+ssssyyyo/-`     ",
	"          `./o+syyhyyhhysysssooososysshhhhhydddhhyssosoooo++osyyyyyssso++:`        ",
	"            `-+yhhhhhhyyyysyyoss+/+oo/+ssyyhhydhhhhhhyyoooosssoo+syso-             ",
	"               `:+oyhsosyhhssy+/`  `  `.-+syyhyyhhhhhdhhyysyyyyssoooo/:`           ",
	"                  `.:ohyhhhh+s/-`         `-+ssyssssssssys++/ooos+ssoso.           ",
	"                     ``-//os:` ``           `/oyso+o+oooso+o//oosssyyss:`          ",
	"                         ``                    -sysyyyyoosoosos+oysyyh:``          ",
	"                                                 `/syhyssyyy+y+:```                ",
}

dashboard.section.header.val = basil

dashboard.section.buttons.val = {
	dashboard.button("e", "New", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "Find", ":Telescope find_files<CR>"),
	dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
