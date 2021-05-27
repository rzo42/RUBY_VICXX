=begin
FILE:RVCOMMANDS
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:COMMANDS FOR RUBY_VICXX
=end


#declare new program		
class MODULE 
	def initialize (title,s_start)
		@@title=title
		@@start=s_start
		puts "...................................................................................................."
		$prog_c+=1
		$s_start=@@start
		$l_hash[@@title]=$s_start    
		$start_l_h[$prog_c][1]=$s_start/256
		$start_l_h[$prog_c][0]=$s_start-$start_l_h[$prog_c][1]*256
	
		$prg_title[$prog_c]=@@title
		puts $prg_title[$prog_c]
		puts "start adress=#{$s_start}"
		puts $start_l_h[$prog_c][0] 
		puts $start_l_h[$prog_c][1]

		$byte_c[$prog_c]=0
		$cycle_c[$prog_c]=0
		puts "...................................................................................................."
		puts $prg_title[$prog_c]
		end
	#declare variable block	
	end
#insert file data
class IMPORT 
	def initialize (title,fil,addr,*addr2)
		@@title=title
		@@file=IO.binread(fil).unpack("C*")
		@@f_name=fil
		@@address=addr
		@@address2=addr2
		
		if @@address==0
			@@address=@@address2
		elsif @@address==1
			@@address=@@file[0]+@@file[1]*256
			@@file.delete_at(0)
			@@file.delete_at(0)
		elsif @@address==3
			@@address=@@addres2
			@@file.delete_at(0)
			@@file.delete_at(0)	
		else	e_call 2		
			end
		MODULE.new @@title,@@address
		puts "file name:#{@@f_name}"
		for t in @@file
			pre_build 0,t
			end
		end	
	end
#declare new label 
class LABEL
	def initialize (l_name)
		@@title=l_name
		puts @@title
		$l_hash[@@title]=$s_start+$byte_c[$prog_c]
		end
	end
class POKE
	def self.poker address,amode,value
	@address,@value,@amode=address,value,:ix
		if not @value.is_a?(Array)
			@value[0]=@value
			if @value[0].is_a?(String)||@value[0]>255
				@value[1]=:ab
			else @value=:im
			end
		elsif @value.size==1	
			if @value[0].is_a?(String)||@value[0]>255
				@value[1]=:ab
			else @value=:im	
			end
	end	
			Whens.lda @value[0],@value[1]
			Whens.sta @address,@amode
end		
	def self.ix address,value
			POKE.poker address,:ix,value
		end		
		
	def self.zp address,value
			POKE.poker address,:zp,value
					end
	def self.ab address,value
			POKE.poker address,:ab,value
					end
	def self.iy address,value
			POKE.poker address,:iy,value
					end
	def self.zx address,value
			POKE.poker address,:zx,value
					end
	def self.ay address,value
			POKE.poker address,:ay,value
					end
	def self.ax address,value
			POKE.poker address,:ax,value
	end

end	
class LOAD
	def self.block length,title,a,x,y,*address
	#LOAD.block 0,"file name",1,8,1
	@length,@title,@a,@x,@y,@address=length,title,a,x,y,*address[0]
		if @length==0
			@length=@title.size-1
			JMP.ab $s_start+$byte_c[$prog_c]+@string.size+4
			@call=$s_start+$byte_c[$prog_c]
			for t in @title.unpack('C*')
				pre_build 0,t
			end
			@title=@call
		end		
		_SETFLS @a,@x,@y
		_SETNAM @length,@title
		_LOAD 0,@address	
	end
end
class VERIFY
	def self.file length,title,a,x,y,*address
	#LOAD.block 0,"file name",1,8,1
	@length,@title,@a,@x,@y,@address=length,title,a,x,y,*address[0]
		if @length==0
			@length=@title.size-1
			JMP.ab $s_start+$byte_c[$prog_c]+@string.size+4
			@call=$s_start+$byte_c[$prog_c]
			for t in @title.unpack('C*')
				pre_build 0,t
			end
			@title=@call
		end		
		_SETFLS @a,@x,@y
		_SETNAM @length,@title
		_LOAD 1,@address	
	end
end
class SAVE
	def self.block vector,length,title,a,x,y,address,ends
	#SAVE.block 0,"file name",1,8,1
	@vector,@length,@title,@a,@x,@y,@address,@ends=vector,length,title,a,x,y,address,ends
		if @length==0
			@length=@title.size-1
			JMP.ab $s_start+$byte_c[$prog_c]+@string.size+4
			@call=$s_start+$byte_c[$prog_c]
			for t in @title.unpack('C*')
				pre_build 0,t
			end
			@title=@call
		end		
		_SETFLS @a,@x,@y
		_SETNAM @length,@title
		_SAVE @vector,@address,@ends	
	end
	
end
class PRINT
	def self.key
		JSR.ip $SCNKEY
		JSR.ip $GETIN
		JSR.ip $CHROUT
	end	
	def self.str string
	#PRINT.str "string" ;prints local string ;equivilant to print"string" in basic
	
	#PRINT.str ["label"] \ #PRINT.str [$var{'$hello']} \ #PRINT.str [0xA00]   
	@string=string
		if @string.is_a?(String)
			JMP.ab current+@string.size+4
			@call=current
			for t in @string.unpack('C*')
			pre_build 0,t
			
			end
			pre_build 0,0
			@string=@call
		puts nil
		end
		
		LDY.im 0
		@call=current
		LDA.ay @string
		CMP.im 0
		BEQ.rl 7
		JSR.ab $CHROUT
		INY.ip
		CLV.ip
		BVC.rl 255-(current-@call)-1
				
	end
end



class GET
	def self.key
		_SCNKEY
		_GETIN
	end
	def self.joy 
			LDA.im $Joy_on
			STA.ab $JOYxo
			LDA.ab $JOY2
			AND.im 0b10000000
			TAX. 
			LDA.im $joy_off
			STA.ab $JOYxo
			LDA.ab $JOY1
			AND.im 0b00111100
			CPX.im 0b10000000
			BNE.rl 3
			CLC.ip
			ADC.im 0b10000000
	end
end	
class VAR
#				BYTE	WORD
#float		:	~	:	
#integer	:	%	:	%%
#unsigned	:	+	:	++
#string		:	$	:	
#pascal		:	?	:	??
#char string:	@	:	@@


	def self.block label, *variable
	#VAR.block 'vars',['%8int,5],['$string','hello world'],['%%16int',0x2f35]
	@variable=variable;puts "varable block";LABEL.new label
		for t in [0...@variable.size]
			@name,@value=@variable[t][0][0],@variable[t][0][1]
			$var[@name]=$s_start+$byte_c[$prog_c]
			$sym[@name]=@name[0]
			if @name[0]==@name[1];$sym[@name]=@name[0..1]
			else $sym[@name]=@name[0]
			end
			case $sym[@name]
				when "+" 			#8bit unsigned integer
					DATA.byte @value
				when "++" #16bit unsigned integer
					DATA.word @value
				when "%" #8bit integer
					DATA.int @value
				when "%%" #16bit integer
					DATA.int_ @value
				when "$" #string 
					DATA.string @value
				when "@" #8bit charachter index string
					DATA.char @value
				when "@@" #16bit charachter index string 
					DATA.char_ @value
				when "?" #pascal string (8bit length)
					DATA.pasc @value
				when "??" #pascal string (8bit length)
					DATA.pasc_ @value
				end
			puts nil
			end
			puts "...................................................................................................."
		end	
		
	def self.let name,value
	#VAR.let '#name',0x1c,
	#VAR.let '$name', 'string'
	@name,@value=name,value
		
		case $sym[@name]
		
		#8bit '+' unsigned integer (0 to 255)| 8bit '%' integer (-127 to 127) 
			#VAR.let '+hp',55 	VAR.let '%hit,-20 	VAR.let '+mp',[5038]  	
			#VAR.let '+hp,$var['+mp'] VAR.let '%def',['label']
		when '+'||'%'
			if @value.is_a?(Array);@value=@value[0]
				if @value>255||@value.is_a?(String);LDA.ab @value
				elsif @value<256;LDA.zp @value
				end
			elsif @value>-128&&@value<256
				if $sym[@name]=='%'&&@value<0;@value=256-@value;end
				if $sym[@name]=='%'&&@value>128;er_rpt 7;end
				if $sym[@name]=='+'&&@value<0;er_rpt 7;end
				LDA.im @value
			else er_rpt 7
			end			
			if $var[@name]<256;STA.zp $var[@name]
			else STA.ab $var[@name]
			end
			
		#16bit unsigned integer (0 to 65535)|16 bit integer	(-32767 to 32767)
			#VAR.let '++hp',555		VAR.let '%%hit,-3320 	VAR.let '++mp',[5038]  	
			#VAR.let '++hp,$var['++mp']    VAR.let '%%def',['label']
		when '++'||'%%'	#VAR.set '##HP',5034	VAR.set '##HP',[825]		VAR.set '##HP'['label]
			if @value.is_a?(Array);@value=@value[0]
				if @value.is_a?(String);LDA.ab @value;LDX.ab "1+"+@value
				elsif @value>255;LDA.ab @value;LDX.ab @value+1
				elsif @value<256;LDA.zp @value;LDX.zp @value+1
				end
			
			elsif $sym[@name]=='%%' 
				if @value>-32768||@value<32768
					if @value<0;@value=32768-@value;end
					LDA.im lo(@value);LDX.im hi(@value)
				else er_rpt 8	
				end
				LDA.im lo(@value);LDX.im hi(@value)
			else LDA.im lo(@value);LDX.im hi(@value)
			end
			if $var[@name]<256;STA.zp $var[@name];STX.zp $var[@name]+1
			else STA.ab $var[@name];STX.ab $var[@name]+1
			end
		
		#ascii string 
			#VAR.let '$hworld',"hello world" 	VAR.let '$hworld',[0xa000] 
		when '$'
			if @value.is_a?(Array);@length=@value[1]+1;@value=@value[0]
			else @length=@value.length-1
				JMP.ab current+@length+4
				@call=$s_start+current
				DATA.string @value
				@value=@call
			end	
				
			if @value>255||@value.is_a?(String);
				LDY.im 0
				LDA.ay @value
				if $var[@name] >255
				STA.ay $var[@name] 
				else STA.zy $var[@name] 
				end
				INY.ip
				CPY.im @length
				BNE.rl "-11"
				LDA.im 0
				if $var[@name] >255
				STA.ay $var[@name] 
				else STA.zy $var[@name] 
				end
					
			elsif @value<256
				LDY.im 0
				LDA.zy @value
				if $var[@name] 
					STA.ay $var[@name] 
				else STA.zy $var[@name] 
				end
					
				INY.ip
				CPY.im @length
				BNE.rl "-11"
				LDA.im 0
				if $var[@name] >255
				STA.ay $var[@name] 
				else STA.zy $var[@name] 
				end
			end
		
		
		
		
		#charachter index||pascal string
		#VAR.let '@@hworld',"hello world" 	VAR.let '??hworld',[0xa000] 
		
		when '@'||'?' #addressed VAR.let '$hw',["hello world",11],0xa000 (name,{pointer,length],address
			if  @value.is_a?(Array)
				@value=@value[0]
			elsif @value.is_a?(String)&&@value.length<256		
				JMP.ab current+@value.length+1
				@pointer=current
				
				
				if $sym[@name]=="@";DATA.char @value;end
				if $sym[@name]=="?";DATA.pasc @value;end
				
				@value=@pointer
			else er_rpt 8
			end	
			if @value.is_a?(String)
				@vstart="1"+@value
			else @vstart=@value+1
			end
			if @value.is_a(String)||@value>255
				LDA.ab @value
			else LDA.zp @value
			end
			if $var[@name]>255
				STA.ab $var[@name]
			else STA.zp $var[@name]	
			end
			LDX.im 0
			@loop=current
			if @vsatart>255||@vstart.is_a?(String)
			LDA.ax @vstart
			else LDA.zx @vstart
			end 
			if $var[@name]+1>255
			STA.ax $var[@name]+1
			else STA.zx $var[@name]+1
			end
			INX.ip
			if @value>255
			CPX.ab @value
			else CPX.zp @value
			end
			BNE.rl current-@loop
		
		#float
		#VAR.let '~money',123.456	VAR.let '~weight',[0xb000] 	VAR.let '~distance',['label']
		when '~'	
			if @value.is_a?(Array);@value=@value[0]
			elsif @value.is_a?(String);@value=@value.to_f
			else	clc.ip
				BCC.rl 6
				if @vlaue<-10**38||@value>10**38;er_rpt 1;end
				@start=current
				DATA.float @value
				@value=@start
			end
			
			LDX.im
			@loop=current
			if @value.is_a?(String)||@value>255
				LDA.ay @value
			else LDA.ab @value
			end
			if $VAR[@name]>255
				STA.ax $var[@name]
			else STA.zx @var[@name]
			end
			INX.ip
			CMP.im 5
			BNE.rl @loop.to_s
		end
	end
end
class DATA
	def self.asc *_pet
		@pet=_pet
		for t in @pet
			pre_build 0,t.ord
			end
		puts nil
		end		
	def self.poke *_str
		@str=str
		for tt in [0...@str.size]
			@_str=@str[tt]
			@string=@_str.unpack("C*")
			for t in @string
				pre_build 0,$poke[t.chr]
			end
			puts nil
		end
	end	
	def self.import (fil,*addr)
		@f_name=fil
		@file=IO.binread(@f_name).unpack("C*")
		@address=addr
		puts "file name:#{@@f_name}"
		if @address==2
			@file.delete_at(0)
			@file.delete_at(0)
		end
		for t in @file
			pre_build 0,t
		end
		puts nil	
	end	
	def self.byte *x
	@x=x
		for t in [0...@x.size]
			@y=@x[t][0].to_i
			if@y<0||@y>255;er_rpt 8;end
			pre_build 0,@y
		end
	end
	def self.word *x
	@x=x
		for t in [0...@x.size]
			@y=@x[t].to_i
			if@y<0||@y>65535;er_rpt 8;end
			pre_build 0,lo(@y)
			pre_build 0,hi(@y)
		end	
	end
	def self.int *x
	@x=x
		for t in [0...@x.size]
			@y=@x[t].to_i
			if@y<-127||@y>127;er_rpt 8;end
			if @y<0;@y=256-@y;end
			pre_build 0,@y
		end
	end
	def self.int_ *x
	@x=x
		for t in [0...@x.size]
			@y=@x[t].to_i
			if@y<-32767||@y>32767;er_rpt 8;end
			if @y<0;@y=32767-@y;end
			pre_build 0,lo(@y)
			pre_build 0,hi(@y)
		end
	

	end
	def self.float *fl #recieves input as *fl
	@fl=fl
		for tt in [0..@fl.size]
			@x=@fl[tt]
			@x=x.to_s 							#converts input to a string as @x
			@float=BigDecimal (@x) 			#converts @x to BigDecimal type as @float
			@absolute=BigDecimal(@x).abs 	#retrieves the absolute value of @x to @absolute
			@integer=@absolute.floor   		#extracts the integer from @absolute to @integer 
			@fraction=BigDecimal((@absolute-@integer).to_s)	#extracts fraction as a string to @fraction
			@bin_integer=(@integer.to_s(2)) #coverts integer as binary string to @bin_interger

#sets up sign bit as a string on @ sign
			if @float==@absolute 	#determins sign 
				@sign="0"		 			#if positiv
			else @sign="1"			#if negative
			end

#generates the fraction portion for the final binary string 
			@bin_fraction=String.new #initializes @convert as an empty string
			@frac=@fraction 				#tranfers @fraction to @frac
			@y=0 							#sets @y as a counter starting at 0
			while @y<62#@y<31-(@bin_integer.length-1)  				 #sets up loop for 0 to (31 - [binary integer length])
				@frac=@frac*BigDecimal("2.0") 						#multiplys @fraction *2
				@floor=BigDecimal((@floor=@frac.floor.to_s)) 	#extract integer from result
				@bin_fraction=@bin_fraction+(@floor.to_i).to_s	#Drops interger (1 or 0) as a bit in a binary string to @convert		
				@frac=@frac-@floor										#extract new fraction
				@y+=1														#increment @y and loop 														
			end

#extracts exponant byte and proccesses the integer segment
			if @integer>0  					 		#if integer is > 0
				@exponent=(@bin_integer.length+128).to_s(2) #extracts length of binary integer string to @exponent
				@bin_integer=(@bin_integer[1..-1]) 	#drops the assumed bit from binary integer string

#if integer = 0 
			else @exponent=@bin_fraction	#tranfer @bin_fraction to @exponent 	
				@bin_integer=nil.to_s			#deletes integer segment
				@y=0								#sets @y to 0 for counter
				while @exponent[0]=="0"		#if bit=0
					@exponent=(@exponent[1..-1]) #delete 0-bit
					@y+=1								#increment @y
				end
				@exponent=(-@y+128).to_s(2)	#sets exponent byte as a binary string 
				while @exponent.length<8  	#fills exponent byte
					@exponent="0"+@exponent		#until size = 8
				end
			end

#sets up output
			@bin_fraction=@bin_fraction[0...31-@bin_integer.length] 	#trims extra bytes off of fraction
			@bin_string=@exponent+@sign+@bin_integer+@bin_fraction		#joins segments together in a single
			@float_array=[0,0]													#initializes array for output
			@labels="exponent  ","mantissa 1","mantissa 2","mantissa 3","mantissa 4"#byte labels for output
			@y=0												#sets @y to 0 for counter
			while @y<5										#sets loop until @y=5
				@float_array[@y]=(((@bin_string.slice(0..7)).to_i(2)).chr).unpack("H*") #slices the binary string
				@bin_string=@bin_string.slice(8..-1) #...into 8-bit segments and converts to hex output to @float_array[@y]
				@y+=1 			#increment @y and loop
			end

#outputs 40-bit scaler float as bytes in hex format
			for t in (0..4) 					#sets loop
				print "#{@labels[t]} = "			#prints byte label
				pre_build 0,@float_array[t][0]		#outputs byte
			end
		end
	end	
	def self.string *x
		@x=x
		for t in [0..@x.size]
			@value=@x[t]
			for t2 in @value.unpack("C*")
				pre_build 0,t2
			end
			pre_build 0,0
		end		
	end
	def self.char *x
		@x=x
		for t in [0..@x.size]
			@value=@x[t]
			pre_build 0,@value.length-1
			for t2 in @value.unpack("C*")
				pre_build 0,$poke[t2.chr]
			end
		end		
	end
	def self.char_ *x
		@x=x
		for t in [0..@x.size]
		@value=@x[t]
			pre_build 0,lo(@value.length-1)
			pre_build 0,hi(@value.length-1)
			for t2 in @value.unpack("C*")
				pre_build 0,$poke[t2.chr]
			end
		end
	end
	def self.pasc *x
		@x=x
		for t in [0..@x.size]
			@value=@x[t]
			pre_build 0,@value.length-1
			for t2 in @value.unpack("C*")
				pre_build 0,t2
			end
		end		
	end			
	def self.pasc_ *x
		@x=x
		for t in [0..@x.size]
			@value=@x[t]
			pre_build 0,lo(@value.length-1)
			pre_build 0,hi(@value.length-1)
			for t2 in @value.unpack("C*")
				pre_build 0,t2
			end
		end			
	end	
end



