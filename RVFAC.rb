=begin
FILE:RVFAC
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:FAC COMMANDS FOR RUBY_VICXX
=end


#FAC COMMANDS
def _Y2FAC *x
@x=x	
		if@x.length>0
			if @x.length==1
				if @x[0].is_a?(String)||@x[0]>255;@x[1]=:ab
				else @x[1]=:im
				end
			end
			Whens.ldy @x[1],@x[0]
		end
		JSR.ab $Y2FAC
	end	
def _PRNFAC

JSR.ab $PRNFAC
end

