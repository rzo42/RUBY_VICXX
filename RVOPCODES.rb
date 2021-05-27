=begin
FILE:RVOPCODES
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:OPCODE GENERATOR FOR RUBY_VICXX
=end


#opcodes
class Opcode
@@command=97
		@@value=0
		@@cycle=0
		@@cycalt=0
		@@byte=0
		@@command=0
		@@poke,@@peek,@@mode=0,0,0
	def self.out
		$cycle_c[$prog_c]+=@@cycle
		if $start_l_h[$prog_c][0]+@@byte>256
			$cycle_c[$prog_c]+=@@cycalt
			end	
		pre_build @@cycle,@@command
		if @@byte==3
			if @@value.is_a? String
				low="label"
				hi=@@value			
				else hi=@@value/256
					low=@@value-(hi*256)
				end	
			if low.is_a? Integer
				if low>255
					er_rep 1
					end
				end
				pre_build @@cycle,low
				@@value=hi
			elsif @@value.is_a? Integer
					if @@value>255
						er_rpt 1
						end
			end
		if @@byte>1
			pre_build @@cycle,@@value
			end
		print "\n"	
	end	
	
	def self.ix value
		er_rep 1
		er=gets
		end
	def self.zp value
		er_rep 1
		er=gets
		end
	def self.im value
		er_rep 1
		er=gets
		end
	def self.ab value
		er_rep 1
		er=gets
		end
	def self.iy value
		er_rep 1
		er=gets
		end
	def self.zy value
		er_rep 1
		er=gets
		end
	def self.zx value
		er_rep 1
		er=gets
		end
	def self.ay value
		er_rep 1
		er=gets
		end
	def self.ax value
		er_rep 1
		er=gets
		end
	def self.in value
		er_rep 1
		er=gets
		end
	def self.rl value
		er_rep 1
		er=gets
		end
	def self.ip
		er_rep 1
		er=gets
		end
	
	end
class Branch<Opcode 
	def self.rl value
		@@value=value
		@@cycle=2
		@@cycalt=1
		@@byte=2
		if @@value.is_a? String
			@@value="!" + @@value
			end
		Opcode.out ###switch to Branch.rl_out for relative addressing
		end
	end
class ADC<Opcode 
	def self.ix value
		@@command=97
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=101
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=105
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=109
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=113
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=117
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=121
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=125
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class AND<Opcode 
	def self.ix value
		@@command=33
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=37
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=41
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=45
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=49
		@@value=value
		@@cycle=5
		@@cycalt=
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=53
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=57
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=61
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	end
class ASL<Opcode 
	def self.zp value
		@@command=6
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ip
	    @@command=10
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	def self.ab value
		@@command=14
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zx value
		@@command=22
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ax value
		@@command=30
		@@value=value
		@@cycle=7
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	end
class BCC<Branch 
	def self.rl value
		@@command=144
		super
		end
	end
class BCS<Branch 
	def self.rl value
		@@command=176
		super
		end
	end
class BEQ<Branch 
	def self.rl value
		@@command=240
		super
		end
	end
class BIT<Opcode 
	def self.zp value
		@@command=36
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=44
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class BMI<Branch 
	def self.rl value
		@@command=48
		super
		end
	end
class BNE<Branch 
	def self.rl value
		@@command=208
		super
		end
	end
class BPL<Branch 
	def self.rl value
		@@command=16
		super
		end
	end
class BRK<Branch 
		def self.ip 
		@@command=0
		@@value=nil
		@@cycle=7
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class BVC<Branch 
	def self.rl value
		@@command=80
		super
		end
	end
class BVS<Branch 
	def self.rl value
		@@command=112
		super
		end
	end
class CLC<Opcode 
		def self.ip 
		@@command=24
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class CLD<Opcode
		def self.ip 
		@@command=216
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class CLI<Opcode
		def self.ip 
		@@command=88
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class CLV<Opcode
		def self.ip 
		@@command=184
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class CMP<Opcode 
	def self.ix value
		@@command=193
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=197
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=201
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=205
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=209
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=213
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=217
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=221
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class CPX<Opcode 
		def self.zp value
		@@command=228
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=224
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=236
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class CPY<Opcode 
		def self.zp value
		@@command=196
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=192
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=204
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class DEC<Opcode 
		def self.zp value
		@@command=198
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=214
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=206
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=222
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class DEX<Opcode
		def self.ip 
		@@command=202
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		end
	end
class DEY<Opcode
		def self.ip 
		@@command=136
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		end
	end
class EOR<Opcode 
		def self.ix value
		@@command=65
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=69
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
	
		@@command=73
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=77
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=81
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=85
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=89
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=93
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class INC<Opcode 
		def self.zp value
		@@command=230
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=246
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=238
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=254
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class INX<Opcode
		def self.ip 
		@@command=232
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		end
	end
class INY<Opcode
		def self.ip 
		@@command=200
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class JMP<Opcode
		def self.ab value 
		@@command=76
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.in value 
		@@command=108
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class JSR<Opcode
		def self.ab value 
		@@command=32
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class LDA<Opcode 
	def self.ix value
		@@command=161
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=165
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
	
		@@command=169
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=173
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=177
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=191
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=185
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=189
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class LDX<Opcode 
	def self.zp value
		@@command=166
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=162
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=174
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zy value
		@@command=182
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=190
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	end
class LDY<Opcode 
		def self.zp value
		@@command=164
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=160
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=172
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	def self.zx value
		@@command=180
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end

	def self.ax value
		@@command=188
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class LSR<Opcode 
		def self.zp value
		@@command=70
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ip
		@@command=74
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	def self.ab value
		@@command=78
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zx value
		@@command=86
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ax value
		@@command=94
		@@value=value
		@@cycle=7
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class NOP<Opcode
	def self.ip 
		@@command=234
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class ORA<Opcode 
		def self.ix value
		@@command=1
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=5
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
	    @@command=9
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=13
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=17
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=21
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=25
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=29
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class PHA<Opcode
		def self.ip 
		@@command=72
		@@value=nil
		@@cycle=3
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class PHP<Opcode
		def self.ip 
		@@command=8
		@@value=nil
		@@cycle=3
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class PLA<Opcode
		def self.ip 
		@@command=10
		@@value=nil
		@@cycle=4
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class PLP<Opcode
		def self.ip 
		@@command=40
		@@value=nil
		@@cycle=4
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class ROL<Opcode 
		def self.zp value
		@@command=38
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ip
	    @@command=42
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	def self.ab value
		@@command=6
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zx value
		@@command=54
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ax value
		@@command=62
		@@value=value
		@@cycle=7
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	end
class ROR<Opcode 
		def self.zp value
		@@command=102
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ip
	    @@command=106
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	def self.ab value
		@@command=110
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zx value
		@@command=118
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ax value
		@@command=126
		@@value=value
		@@cycle=7
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	end
class RTI<Opcode
		def self.ip 
		@@command=64
		@@value=nil
		@@cycle=6
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class RTS<Opcode
		def self.ip 
		@@command=96
		@@value=nil
		@@cycle=6
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class SBC<Opcode 
		def self.ix value
		@@command=225
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=229
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.im value
		@@command=233
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=237
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=241
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=245
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=249
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=253
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class SEC<Opcode
		def self.ip 
		@@command=56
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class SED<Opcode
		def self.ip 
		@@command=248
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class SEI<Opcode
		def self.ip 
		@@command=120
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class STA<Opcode 
	def self.ix value
		@@command=129
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=133
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=141
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=145
		@@value=value
		@@cycle=6
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=149
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=153
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=157
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	end
class STX<Opcode 
	def self.zp value
		@@command=134
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=141
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zy value
		@@command=150
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	
	end
class STY<Opcode 
	def self.zp value
		@@command=132
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=140
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zx value
		@@command=148
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	end
class TAX<Opcode
		def self.ip 
		@@command=170
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class TAY<Opcode
		def self.ip 
		@@command=168
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class TSX<Opcode
		def self.ip 
		@@command=186
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		end
	end
class TXA<Opcode
		def self.ip 
		@@command=138
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class TXS<Opcode
		def self.ip 
		@@command=154
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
class TYA<Opcode
		def self.ip 
		@@command=152
		@@value=nil
		@@cycle=2
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end
#undocumented opcodes
class SLO<Opcode #Asl Or 
	def self.ix value
		@@command=3
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=7
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=15
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=19
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=23
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("1b")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=31
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	end
class RLA<Opcode #Rol And
		def self.ix value
		@@command=h("23")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("27")
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("2f")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=h("33")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=h("37")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("3b")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=h("3f")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	end
class SRE<Opcode #Lsr Eor
	
	def self.ix value
		@@command=h("43")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("47")
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("4f")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=h("53")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=h("57")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("5b")
		@@value=value
		@@cycle=0
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=h("5f")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	end
class RRA<Opcode #Ror Adc
	def self.ix value
		@@command=h("63")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("67")
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("6f")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=h("73")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=h("77")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("7b")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=h("7f")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	end
class SXA<Opcode #Sta Stx
		def self.ix value
		@@command=h("83")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("87")
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("8f")
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.zy value
		@@command=h("97")
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	
	end
class LXA<Opcode #Lda Ldx
	def self.ix value
		@@command=h("a3")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("a7")
		@@value=value
		@@cycle=3
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("af")
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=h("b3")
		@@value=value
		@@cycle=5
		@@cycalt=1
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("bf")
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
	
	def self.zy value
		@@command=h("b7")
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	end
class DCP<Opcode #Dec Cmp
		def self.ix value
		@@command=h("c3")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("c7")
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("cf")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=("d3")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=("d7")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("db")
		@@value=value
		@@cycle=7
		@@cycalt=
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=h("df")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	end
class ISB<Opcode #Inc Sbc
	def self.ix value
		@@command=h("e3")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zp value
		@@command=h("e7")
		@@value=value
		@@cycle=5
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ab value
		@@command=h("ef")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.iy value
		@@command=h("f3")
		@@value=value
		@@cycle=8
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.zx value
		@@command=h("f7")
		@@value=value
		@@cycle=6
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	def self.ay value
		@@command=h("73")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	def self.ax value
		@@command=h("ff")
		@@value=value
		@@cycle=7
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
	
	end
class ANC<Opcode #And Rol/Asl
	def self.im value
		@@command=h("ob")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	end
class ALR<Opcode #And Lsr
	def self.ix value
		@@command=h("4b")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	end
class ARR<Opcode #And Ror
	def self.im value
		@@command=h("6b")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
		end
class SBX<Opcode #Cmp Dex
	def self.im value
		@@command=h("cb")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
		end
class SBN<Opcode #Sbc Nop (Sbc)
	def self.im value
		@@command=h("eb")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
		end
class LAS<Opcode #Sta/Txs Lda/Tsx
	def self.ay value
		@@command=h("bb")
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
		end
class SKB<Opcode #skip byte
		def self.c2 value
		@@command=h("80")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
		def self.c3 value
		@@command=h("04")
		@@value=value
		@@cycle=2
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
		def self.c4 value
		@@command=h("14")
		@@value=value
		@@cycle=
		@@cycalt=0
		@@byte=2
		Opcode.out
		end
	end
class SKW<Opcode #skip word
		def self.c4 value
		@@command=0x0c
		@@value=value
		@@cycle=4
		@@cycalt=0
		@@byte=3
		Opcode.out
		end
		def self.c5 value
		@@command=0x1c
		@@value=value
		@@cycle=4
		@@cycalt=1
		@@byte=3
		Opcode.out
		end
		
	end
class JAM<Opcode #cpu jam
		def self.cpu 
		@@command=h("02")
		@@value=nil
		@@cycle=0
		@@cycalt=0
		@@byte=1
		Opcode.out
		end
	end

