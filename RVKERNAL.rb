=begin
FILE:RVKERNAL
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:KERNAL COMMANDS FOR RUBY_VICXX
=end


#kernal commands
def _ACPTR
	JSR.ab $ACPTR
end
def _CHKIN *x
		@x=x
		if@x.size>0
			if @x.size==1
				@x[0]=@x
				if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
				else @x[1]=:im
				end
			end
			Whens.ldx @x[0],@x[1]
		end
		JSR.ab $CHKIN
	end	
def _CHKOUT *x
		@x=x
		if@x.size>0
			if @x.size==1
				@x[0]=@x
				if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
				else @x[1]=:im
				end
			end
			Whens.ldx @x[0],@x[1]
		end
		JSR.ab $CHKOUT
	end	
def _CHRIN
	JSR.ab $CHRIN
end
def _CHROUT *x
		@x=x		
		if@x.size>0
			if @x.size==1
				#@x[0]=@x
				if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
				else @x[1]=:im
				end
			end
			Whens.lda @x[1],@x[0]
		end
		JSR.ab $CHROUT
	end	
def _GETIN
		JSR.ab $GETIN
	end
def _LOAD *x 
	#LOAD.krn [a,mode], [x,mode],[y,mode] 
	#LOAD.krn [a],[x],[y] ;no mode argument-8bit=im,16bit=ab,string=ab
	#LOAD.krn address ;single value will be interpereted as 16 bit address and applied to x/y in im modes
		#a is set to 0 with im mmode for load.
	@xy,@a,@x,@y=x,x[0],x[1],x[3]
		lda.im 0
		if @xy.size>1
			if @a[1].size==0
				if @a[0].is_a?(String)||@x[0]>255
					@a[1]=:ab
				else @a[1]=:zp
				end
			end
			if @x[1].size==0
				if @x[0].is_a?(String)||@x[0]>255
					@x[1]=:ab
				else @x[1]=:zp
				end
			end
			if @y[1].size==0
				if @y[0].is_a?(String)||@y[0]>255
					@y[1]=:ab
				else @x[1]=:zp
				end
			end
		
		elsif @xy.size==1
			a[0],a[1]=1,:im
			if @x[0].is_a?(String);@y[0]=">"+@x[0];@x[0]="<"+@x[0]
			else @y[0]=hi(@x[0]);@x[0]=lo(@x[0])
			end
			x[1]=:im;y[1]=:im
		end
		Whens.lda @a[0],@a[1]
		Whens.ldx @x[0],@x[1]
		Whens.ldy @y[0],@y[1]
		JSR.ip $LOAD
	end
def _OPEN
		JSR.ab OPEN
		end
def _PLOT c,*xy
	#_PLOT 0,0,5
	#_PLOT 1
	#_PLOT 0
	#_PLOT 0,[2,:zp],[3,:zp]
	@carry,@x,@y,@xy=c,xy[0],xy[1],xy
	if @c==0
		if @xy.size>0
			if @x.size !=2
				if @x.is_a?(String)||@x>255
					@x[0]=@x;@x[1]=:ab
				else @x[0]=@x;@x[1]=:im
				end
			end	
			if @y.size !=2
				if @y.is_a?(String)||@y>255
					@y[0]=@y;@y[1]=:ab
				else @y[0]=@y;@y[1]=:im
				end
			end
			Whens.ldx @x[0],@x[1]
			Whens.ldy @y[0],@y[1]
		end
		CLC.ip
	else SEC.ip
	end
	JSR.ab $PLOT
end	
def _SETLFS a,x,y
 	@a,@x,@y=a,x,y
	if @a.is_a?(Array)
		if @a.size==1
			if @a[0].is_a?(String)||@a[0]>255;@a[1]=:ab
			else @a[1]=:im
			end
		end
	else @a[0]=@a
		if @a[0].is_a?(String)||@a[0]>255;@a[1]=:ab
		else @a[1]=:im
		end
	end
	if @x.is_a?(Array)
		if @x.size==1
			if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
			else @x[1]=:im
			end
		end
	else @x[0]=@x
		if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
		else @x[1]=:im
		end
	end
	if @y.is_a?(Array)
		if @y.size==1
			if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
			else @y[1]=:im
			end
		end
	else @y[0]=@y
		if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
		else @y[1]=:im
		end
	end
	Whens.lda @a[0],@a[1]
	Whens.ldx @x[0],@x[1]
	Whens.ldy @y[0],@y[1]
	JMP.ab $SETLFS
end		
def _SETNAM a,x,*y
	#_SETNAM 8,4800		_SETNAM [3463,:ab],[2561,:ay],[252,:zp}
	#_SETNAM 16,0x00,0xa0
	@a,@x,@y=a,x,y[0]

		if not @a.is_a?(Array);@a[0]=@a
			if @a>255||@a.is_a(String);@a[1]=:ab
			else @a[1]=:im
			end
		elsif @a.size==1
			if @a[0]>255||@a[0].is_a(String);@a[1]=:ab
			else @a[1]=:im
			end
		end
		
		if @y.size>0
			if not @x.is_a?(Array);@x[0]=@x
				if @x>255||@x.is_a(String);@x[1]=:ab
				else @x[1]=:im
				end
			elsif @x.size==1
				if @x[0]>255||@x[0].is_a(String);@x[1]=:ab
				else @x[1]=:im
				end
			end
			if @y.size==1
				if @y[0]>255||@y[0].is_a(String);@a[1]=:ab
				else@y[1]=:im
				end
			end
		elsif not	@x.is_a?(Array)
			if @x.is_a?(string)
				@y[0]=">"+@x;@y[1]=:im
				@x[0]="<"+@x;@x[1]=:im
			else @y[0]=hi(@x);@y[1]=:im
				@x[0]=lo(@x);@x[1]=:im
			end	
		elsif @x.is_a?(Array)&&@x.size=1
			if @x[0].is_a?(string)
				@y[0]=">"+@x[0];@y[1]=:im
				@x[0]="<"+@x[0];@x[1]=:im
			else @y[0]=hi(@x[0]);@y[1]=:im
				@x[0]=lo(@x[0]);@x[1]=:im
			end	
		end
		Whens.lda @a[0],@a[1]
		Whens.ldx @x[0],@x[1]
		Whens.ldy @y[0],@y[1]
		JMP.ab $SETNAM
		end
def _CIOUT a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $CIOUT
	end	
def _CLALL
	JSR.ab $CLALL
end
def _CLOSE a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $CLOSE
end
def _CLRCHN
		JSR.ab $CLRCHN
end
def _IOBASE
		JSR.ab $IOBASE
end
def _LISTEN a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $LISTEN
end
def _MEMBOT c,*xy
	@carry,@x,@y,@xy=c,xy[0],xy[1],xy
	if @c==0
		if @xy.size>0
			if @x.size !=2
				if @x.is_a?(String)||@x>255
					@x[0]=@x;@x[1]=:ab
				else @x[0]=@x;@x[1]=:im
				end
			end	
			if @y.size !=2
				if @y.is_a?(String)||@y>255
					@y[0]=@y;@y[1]=:ab
				else @y[0]=@y;@y[1]=:im
				end
			end
			Whens.ldx @x[0],@x[1]
			Whens.ldy @y[0],@y[1]
		end
		CLC.ip
	else SEC.ip
	end
	JSR.ab $MEMBOT
end	
def _MEMTOP c,*xy
	@carry,@x,@y,@xy=c,xy[0],xy[1],xy
	if @c==0
		if @xy.size>0
			if @x.size !=2
				if @x.is_a?(String)||@x>255
					@x[0]=@x;@x[1]=:ab
				else @x[0]=@x;@x[1]=:im
				end
			end	
			if @y.size !=2
				if @y.is_a?(String)||@y>255
					@y[0]=@y;@y[1]=:ab
				else @y[0]=@y;@y[1]=:im
				end
			end
			Whens.ldx @x[0],@x[1]
			Whens.ldy @y[0],@y[1]
		end
		CLC.ip
	else SEC.ip
	end
	JSR.ab $MEMTOP
end	
def _RDTIM
		JSR.ab $RDTIM
		end
def _READST
		JSR.ab $READST
		end
def _RESTORE
		JSR.ab $RESTORE
		end
def _SCNKEY
		JSR.ip $SCNKEY
		end
def _SCREEN
		JSR.ab $SCREEN
		end
def _SECOND
		JSR.ab $SECOND
		end
def _SAVE vector, address,ends	
	@vector1,@address,@ends=address,ends
		if @vector1.is_a?(String);@vector2="1"+@vector1
		else @vector2=@vector+1
		end
		if @address.is_a? String
				LDA.im "<"+@address
				STA.zp $vector1
				LDA.im ">"+@address
				STA.im @vector2
			else @high=@address/256
				@low=@address-@high*256 
				LDA.im @low
				STA.im @vector1
				LDA.im @high
				STA.im @vector2
				end
			LDA.im @vector1		
		if @ends.is_a? String
				LDX.im "<"+@ends
				LDY.im ">"+@ends
			else @high=@ends/256
				@low=@ends-@high*256 
				LDX.im @low
				LDY.im @high
				end		
		JMP.ab $SAVE
	end
def _SETMSG a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $SETMSG
	end	
def _STOP
		JSR.ab STOP
		end
def _SETTIM a,x,y
 	@a,@x,@y=a,x,y
	if @a.is_a?(Array)
		if @a.size==1
			if @a[0].is_a?(String)||@a[0]>255;@a[1]=:ab
			else @a[1]=:im
			end
		end
	else @a[0]=@a
		if @a[0].is_a?(String)||@a[0]>255;@a[1]=:ab
		else @a[1]=:im
		end
	end
	if @x.is_a?(Array)
		if @x.size==1
			if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
			else @x[1]=:im
			end
		end
	else @x[0]=@x
		if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
		else @x[1]=:im
		end
	end
	if @y.is_a?(Array)
		if @y.size==1
			if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
			else @y[1]=:im
			end
		end
	else @y[0]=@y
		if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
		else @y[1]=:im
		end
	end
	Whens.lda @a[0],@a[1]
	Whens.ldx @x[0],@x[1]
	Whens.ldy @y[0],@y[1]
	JMP.ab $SETTIM
end		
def _SETTMO
	JSR.ab $SETTMO
end
def _TALK a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $TALK
end
def _TKSA a
		@a=a
		if not @a.is_a?(Array)
			if @a.is_a?(String)||@a>255;@a[0]=@a;@a[1]=:ab
			else @a[0]=@a;@a[1]=:ab
			end
		end
		Whens.lda @a[0],@a[1]	
		JSR.ab $TKSA
end
def _UDTIM
		JSR.ab $UDTIM
end
def _UNLSN
		JSR.ab $UNLSN
end
def _UNTLK
		JSR.ab $UNTLK
end
def _VECTOR  c,x,y
 	@c,@x,@y=c,x,y
	
	if @x.is_a?(Array)
		if @x.size==1
			if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
			else @x[1]=:im
			end
		end
	else @x[0]=@x
		if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
		else @x[1]=:im
		end
	end
	if @y.is_a?(Array)
		if @y.size==1
			if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
			else @y[1]=:im
			end
		end
	else @y[0]=@y
		if @y[0].is_a?(String)||@y[0]>255;@y[1]=:ab
		else @y[1]=:im
		end
	end

	Whens.ldx @x[0],@x[1]
	Whens.ldy @y[0],@y[1]
	if@c==0;CLC.ip
	else SEC.ip
	end
	JSR.ab $VECTOR
end	

