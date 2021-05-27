=begin
FILE:RVBUILD
AUTHOR:RYAN LISTON
DATE:5/26/2021
LANGUAGE:RUBY 3.0
REQUIREMENTS :RUBY INTERPRETER
DESCRIPTION:BUILD ROUTINES FOR RUBY_VIXX
=end



#prebuild and output generater
def pre_build (x4,x5)
	$assem [$prog_c][$byte_c[$prog_c]]=x5
	puts "#{x5}\t byte: #{$byte_c[$prog_c]}\t cycles: #{x4}\t total cycles: #{$cycle_c[$prog_c]}\t address: #{$s_start+$byte_c[$prog_c]}"    
	$byte_c[$prog_c]+=1
	end

#builds project to .prg files
module BUILD
class PROJECT
def self.prg
	puts "...................................................................................................."
	puts "building..."
	$p_count=$prog_c
	$prog_c=0
	for $prog_c in (0..$p_count)
		$b_count=0
		for $b_count in (0..$byte_c[$prog_c])
			if $assem[$prog_c][$b_count].is_a? String
				if $assem[$prog_c][$b_count]=="label"
					@@b=[$assem[$prog_c][$b_count+1]]
					@@b=@@b.to_s;@@b=@@b.to_i;
					
					$assem[$prog_c][$b_count+1]=$assem[$prog_c][$b_count+1].delete(@@b.to_s)
					$l_hash[$assem[$prog_c][$b_count+1]]+=@@b
					hi = $l_hash[$assem[$prog_c][$b_count+1]]/256
					low = $l_hash[$assem[$prog_c][$b_count+1]]-(hi*256)
					$assem[$prog_c][$b_count]=low
					$assem[$prog_c][$b_count+1]=hi
					$b_count+=1			
				elsif $assem[$prog_c][$b_count][0]=="!"
						$assem[$prog_c][$b_count][0]=""
						@@b=[$assem[$prog_c][$b_count]].to_i
						$assem[$prog_c][$b_count]=$assem[$prog_c][$b_count].delete(@@b.to_s)
						if @@b<0;@@b+=256;end 
						$l_hash[$assem[$prog_c][$b_count1]]+=@@b
						brn1=$l_hash[$assem[$prog_c][$b_count]]
						brn2=$start_l_h[$prog_c][1]*256+$start_l_h[$prog_c][0]+$b_count	
							if brn1>brn2							
								$assem[$prog_c][$b_count]=brn1-brn2
							else $assem[$prog_c][$b_count]=255-(brn2-brn1)
								end

				else @hilo=$assem[$prog_c][$b_count][0]
					if @hilo=="<"||@hilo==">"
						$assem[$prog_c][$b_count]=$assem[$prog_c][$b_count].delete(@hilo)
						end
					@@b=[$assem[$prog_c][$b_count]].to_i
					$assem[$prog_c][$b_count]=$assem[$prog_c][$b_count].delete(@@b.to_s)
					$l_hash[$assem[$prog_c][$b_count]]+=@@b
					if @hilo=="<"
						$l_hash[$assem[$prog_c][$b_count]]=lo($l_hash[$assem[$prog_c][$b_count]])
					elsif @hilo==">"
						$l_hash[$assem[$prog_c][$b_count]]=hi($l_hash[$assem[$prog_c][$b_count]])
						end
					
					$assem[$prog_c][$b_count]=$l_hash[$assem[$prog_c][$b_count]]
					if $assem[$prog_c][$b_count]>255
						puts $e_call[1]
						puts "@#{$assem[$prog_c][$b_count]}"
						er=gets
						end
					end	
				end
			end
		end
	$prog_c=0
	for $prog_c in (0..$p_count)
		puts "...................................................................................................."
		puts "Include start address for\n   #{$prg_title[$prog_c]}?\n     y=yes\n     n=no"
		er=gets.chomp
			if er=="y"
				$assem[$prog_c].insert(0,$start_l_h[$prog_c][1])
				$assem[$prog_c].insert(0,$start_l_h[$prog_c][0])
				end
		puts "...................................................................................................."
		puts "building #{$prg_title[$prog_c]}"
		puts "...................................................................................................."
		print "#{$assem[$prog_c]}\n"
		end
	puts "...................................................................................................."
	puts "saving #{$prg_title[$prog_c]}.prg"
	file=File.new("#{$prg_title[$prog_c]}.prg","wb")
file.syswrite ($assem[$prog_c].pack("C*"))
file.close
puts "#{$prg_title[$prog_c]}.prg saved"
	puts "build complete!"
	er=gets
	end	
end
end

