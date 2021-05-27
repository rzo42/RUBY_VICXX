=begin
FILE:VAR_TEST
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:TEST FILE TESTING 8BIT UNSIGNED INTEGER ROUTINES IN RUBY_VIXX
=end



require_relative 'RUBY_VICXX'

# sys825 to run program
MODULE.new 'var test',0x338  #starts new program module named 'var test' at 0x338
VAR.block 'vars',['+hp',5]   #creates new variable block named 'vars' and declares +hp=5 



PRINT.str "#{CLEAR}#{BLACK}VARIABLE TEST#{RETURN}8-BIT UNSIGNED#{RETURN}INTEGER#{RETURN}"


_Y2FAC $var['+hp']				#loads y with vlaue stored at +hp and tansfers integer in y to FAC
_PRNFAC								#prints FAC to screen
_CHROUT RETURN.ord				#prints RETURN (new line) 

LDA.ab $var['+hp']				#load accumulator with the value stored at +hp
CLC.ip								#clears the carry bit
ADC.ab $var['+hp']				#adds value stored at +hp to the value in the accumulator
TAY.ip								#tranfer accumulator to y

_Y2FAC								#transfers y to FAC 
_PRNFAC								#prints FAC to screen
_CHROUT RETURN.ord 				#prints RETURN (new line)

VAR.let '+hp',255					#lets +hp=255
_Y2FAC $var['+hp']				#loads y with vlaue stored at +hp and tansfers integer in y to FAC				
_PRNFAC								#prints FAC to screen

LABEL.new 'loop'					#creates label named 'loop'
JMP.ab 'loop'						#loops

BUILD::PROJECT.prg				#builds project to file
