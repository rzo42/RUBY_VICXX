=begin
FILE:RVMETHODS
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:METHODS FOR RUBY_VICXX
=end



#return low end
def lo(value)
	return value&255
	end
#return high end	
def hi(value)
	return value/256
	end
#error report
def er_rpt (e1)
	puts "#{$e_call[0]} #{$e_call[e1]}"
	er=gets
	end
#returns current address
def current
return $s_start+$byte_c[$prog_c]
end

