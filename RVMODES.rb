=begin
FILE:RVMODES
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:MODE CLASS EXTENSION FOR RUBY_VICXX
=end


class Whens
	def self.lda mode,value
		@mode,@value=mode,value
		case @mode	
			when :ix
				LDA.ix @value
			when :zp
				LDA.zp @value
			when :im
				LDA.im @value
			when :ab
				LDA.ab @value
			when :iy
				LDA.iy @value
			when :zx
				LDA.zx @value
			when :ay
				LDA.ay @value
			when :ax
				LDA.ax @value
			when :ip
				LDA.ip @value
			when :in
				LDA.in @value
			when :rl
				LDA.rl @value
			when :zy
				LDA.zy @value		
			else LDA.im @value
			end
		end
	def self.ldx mode,value
		@mode,@value=mode,value
		case @mode	
			when 'ix'
				LDX.ix @value
			when 'zp'
				LDX.zp @value
			when 'im'
				LDX.im @value
			when 'ab'
				LDX.ab @value
			when 'iy'
				LDX.iy @value
			when 'zx'
				LDX.zx @value
			when 'ay'
				LDX.ay @value
			when 'ax'
				LDX.ax @value
			when 'ip'
				LDX.ip @value
			when 'in'
				LDX.in @value
			when 'rl'
				LDX.rl @value
			when 'zy'
				LDX.zy @value		
			else LDX.im @value
			end
		end	
	def self.ldy mode,value
		@mode,@value=mode,value
		case @mode	
			when :ix
				LDY.ix @value
			when :zp
				LDY.zp @value
			when :im
				LDY.im @value
			when :ab
				LDY.ab @value
			when :iy
				LDY.iy @value
			when :zx
				LDY.zx @value
			when :ay
				LDY.ay @value
			when :ax
				LDY.ax @value
			when :ip
				LDY.ip @value
			when :in
				LDY.in @value
			when :rl
				LDY.rl @value
			when :zy
				LDY.zy @value		
			else LDA.im @value
			end
		end	
	def self.sta mode,value
		@mode,@value=mode,value
		case @mode	
			when 'ix'
				STA.ix @value
			when 'zp'
				STA.zp @value
			when 'im'
				STA.im @value
			when 'ab'
				STA.ab @value
			when 'iy'
				STA.iy @value
			when 'zx'
				STA.zx @value
			when 'ay'
				STA.ay @value
			when 'ax'
				STA.ax @value
			when 'ip'
				STA.ip @value
			when 'in'
				STA.in @value
			when 'rl'
				STA.rl @value
			when 'zy'
				STA.zy @value		
			else STA.ab @value
			end
		end	
	def self.stx mode,value
		@mode,@value=mode,value
		case @mode	
			when 'ix'
				STX.ix @value
			when 'zp'
				STX.zp @value
			when 'im'
				STX.im @value
			when 'ab'
				STX.ab @value
			when 'iy'
				STX.iy @value
			when 'zx'
				STX.zx @value
			when 'ay'
				STX.ay @value
			when 'ax'
				STX.ax @value
			when 'ip'
				STX.ip @value
			when 'in'
				STX.in @value
			when 'rl'
				STX.rl @value
			when 'zy'
				STX.zy @value		
			else LDX.im @value
			end
		end	
	def self.sty mode,value
		@mode,@value=mode,value
		case @mode	
			when 'ix'
				STY.ix @value
			when 'zp'
				STY.zp @value
			when 'im'
				STY.im @value
			when 'ab'
				STY.ab @value
			when 'iy'
				STY.iy @value
			when 'zx'
				STY.zx @value
			when 'ay'
				STY.ay @value
			when 'ax'
				STY.ax @value
			when 'ip'
				STY.ip @value
			when 'in'
				STY.in @value
			when 'rl'
				STY.rl @value
			when 'zy'
				STY.zy @value		
			else STY.im @value
			end
		end	
	end

