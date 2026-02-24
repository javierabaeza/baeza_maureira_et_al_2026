#Script to calculate SASA 

mol load psf 3fic_LIG.psf dcd 3fic_LIG.dcd

set n [molinfo top get numframes] 
set outfile [open sasa.dat a]

for { set i 0 } { $i < $n } { incr i } {
  set all [atomselect top all frame $i] 
  set r [measure sasa 1.4 $all]
  #puts [list $i $r]
  puts $outfile [format " %d\t%.4f" $i $r]
}

puts "Check file sasa.dat"
close $outfile
