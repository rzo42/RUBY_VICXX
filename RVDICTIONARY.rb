=begin
FILE:RVDICTIONARY
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:DECLARES VARIABLES, HASHES, STRINGS AND ARRAYS FOR RUBY_VIXX
=end

$prog_c=-1     	#program counter
$byte_c=[0,0]   	#byte counter [program,byte]
$cycle_c=[0,0]		#cycle counter [program,byte]
$assem=[0],[0,0]   #program array for assmbly [program#],[byte#,value]
$start_l_h=[0,0],[0,0] 
$prg_title=[0,0]   #program title [program#,title]

$l_hash={"ryan liston"=>2021} #hash table for labels [label=>address]

#error report string table
$e_call=['error! ','!illegal quantity!',
		'!inappropriate addressing mode!',
		'!unexpexcted string!','!unexpected integer!',
		'!string requires mode deffinition!',
		'!inappropriate command usagage!','!invalid aurgument!',
		'!out of range!','!string to long!' ]

#variable table [name, address]
$var={'%lue'=>42}
$sym={'%lue'=>'%'}
#keernal calls
$ACPTR=63445
$CHKIN=65478
$CHKOUT=65481
$CHRIN=65487
$CHROUT=65490
$CIOUT=65448
$CLALL=65511
$CLOSE=65475
$CLRCHN=65484
$GETIN=65508
$IOBASE=65523
$LISTEN=65457
$LOAD=65493
$MEMBOT=65436
$MEMTOP=65433
$OPEN=65472
$PLOT=65520
$RDTIM=65502
$READST=65463
$RESTOR=65418
$SAVE=65496
$SCNKEY=65439
$SCREEN=65517
$SECOND=65427
$SETLFS=65466
$SETMSG=65424
$SETNAM=65469
$SETTIM=65499
$SETTMO=65442
$STOP=65505
$TALK=65460
$TKSA=65430
$UDTIM=65514
$UNLSN=65454
$UNTLK=65451
$VECTOR=65421

#petscii code
WHITE=5.chr
RED=28.chr
GREEN=30.chr
BLUE=31.chr
BLACK=144.chr
PURPLE=156.chr
YELLOW=158.chr
CYAN=159.chr

L_CASE=14.chr
U_CASE=142.chr
DOWN=17.chr
RIGHT=29.chr
UP=145.chr
LEFT=157.chr
SPACE=32.chr
SH_SPACE=160.chr
RETURN=13.chr
SH_RET=141.chr
REV_ON=18.chr
REV_OFF=146.chr
HOME=19.chr
DELETE=20.chr
CLEAR=147.chr
INSERT=148.chr

AR_UP=94.chr
AR_LEFT=95.chr
POUND=92.chr
SPADE=97.chr
HOLE=113.chr
HEART=115.chr
XING=118.chr
CIRCLE=119.chr
CLUB=120.chr
DIAMOND=122.chr
CROSS=123.chr
PI=126.chr

F1=133.chr
F2=137.chr
F3=134.chr
F4=138.chr
F5=135.chr
F6=139.chr
F7=136.chr
F8=140.chr

SC_OFF=8.chr
SC_ON=9.chr

$FREKZP=0xfb
$ZREG0=$FREKZP
$ZREG1=$FREKZP+1
$ZREG2=$FREKZP+2
$ZREG=$FREKZP+3


#vic addresses
		$JOY1=37151
		$JOY2=37152
		$JOYxo=37154
		$VOX_L=36874
		$VOX_M=36875
		$VOX_H=36876
		$VOX_N=36877
		$VOLUME=36878
		$AUX_C=$VOLUME
		$SCREEN_C=36979
	
		#fac
		$INDEX1=0x22
		$INDEX2=0x24
		$FORNAM=0x49
		$TEMPF3=0x43
		$TEMPF1=0x57
		$TEMPF2=0x5c
		$FAC=0x61
		$AFAC=0x69
		
		
		#ROM CALLS
		
		$Y2FAC=0xd3a2
		$PRNFAC=0xddd7
		$INTIDX=0xd1aa
		$PLUS=0xd86a
		$SUB=0xd853
		$TIMES=0xda28
		$DEVIDE=0xdb12
		$FTOA=0xdc0f
		$MAKFP=0xd391
		$OUTSTR=0xcb24
		$PRTFIX=0xddcd
		$PRTSTR=0xcb1e
		$NMI=65530
		$RESET=65394
		$IRQ=65534
		$IRQX=60095

	#poke codes
		$black="@"
		$white="A"
		$red="B"
		$cyan="C"
		$purple="D"
		$green="E"
		$blue="F"
		$yellow="G"
		$orange="H"
		$l_orange="I"
		$pink="J"
		$l_cyan="K"
		$l_purple="L"
		$l_green="M"
		$l_blue="N"
		$l_yellow="O"
		$joy_on=125
		$joy_off=255



	#poke table
	$poke={"@"=>0,"A"=>1,"B"=>2,"C"=>3,"D"=>4,"E"=>5,"F"=>6,"G"=>7,"H"=>8,"I"=>9,"J"=>10,"K"=>11,"L"=>12,"M"=>13,"N"=>14,"O"=>15,
		"P"=>16,"Q"=>17,"R"=>18,"S"=>19,"T"=>20,"U"=>21,"V"=>22,"W"=>23,"X"=>24,"Y"=>25,"Z"=>26,"["=>27,"£"=>28,"]"=>29,
		"ˆ"=>30,"‹"=>31," "=>32,"!"=>33,"»"=>34,"#"=>35,"$"=>36,"%"=>37,"&"=>38,"›"=>39,"("=>40,")"=>41,"*"=>42,"+"=>43,","=>44,
		"-"=>45,"."=>46,"/"=>47,"0"=>48,"1"=>49,"2"=>50,"3"=>51,"4"=>52,"5"=>53,"6"=>54,"7"=>56,"8"=>57,"9"=>57,":"=>58,";"=>59,
		"<"=>60,"="=>61,">"=>62,"?"=>63,"—"=>64,"a"=>65,"b"=>66,"c"=>67,"d"=>68,"e"=>69,"f"=>70,"g"=>71,"h"=>72,"i"=>73,
		"j"=>74,"k"=>75,"l"=>76,"m"=>77,"n"=>78,"o"=>79,"p"=>80,"q"=>81,"r"=>82,"s"=>83,"t"=>84,"u"=>85,"v"=>86,"w"=>87,
		"x"=>88,"y"=>89,"z"=>90}

