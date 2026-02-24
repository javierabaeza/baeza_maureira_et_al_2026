# Parameters
name = "bin_contact_AvsF"
dataFile = name . ".dat"
outFile = name . ".Docking.svg"
outFile1 = name . ".Docking.png"


set term svg size 960,720
#set term x11
#set term wxt size 960,720
#set term aqua size 960,720
set pm3d at b

set border linewidth 2.5
#set size ratio -1
#set view 0, 0
set view map
set title ""
#set lmargin at screen 0.2
#set rmargin at screen 0.8
#set bmargin at screen 0.2
#set tmargin at screen 0.8
#y1=1; y2=631
#; y3=430; y4=529
#set multiplot

set xrange [300:400]
set xtics 300,8,400
set xtics font "Times New Roman, 22" 
set xtics out
set xtics scale 1.5
set xtics nomirror
#set xtics offset -0.45,1,0
#set xtics offset 0,-0.6,0
set xlabel font "Times New Roman, 30"
set xlabel "chain A residues"
set xlabel offset -2,-1,0

set yrange [43:145]
set ytics  43,8,145
set ytics out
set ytics font "Times New Roman, 22"
set ytics nomirror
set ytics scale 1.5
#set ytics offset 0.5,0.7,0
set ytics offset 1,0,0
set ylabel font "Times New Roman, 30"
set ylabel "chain E residues"
set ylabel offset -1,0,0

unset ztics

# Colorbar
set cbrange [3:15]
set cbtics 3,3,15
set colorbox horizontal user origin 0.23,0.90 size 0.5,0.03
set cbtics font "Times New Roman, 26" 
set cbtics scale 1.5
set cbtics offset 0,-0.2,0
set cblabel "distance (Å)"
set cblabel font "Times New Roman, 30"
set cblabel rotate by -270
set cblabel offset 0,5.0,0


# Color
#set palette defined (0 "#000080", 0.125 "#ffffff", 0.32 "#ffc0c0", 0.5 "#ff0000", 1 "#200000")
#set palette defined (0 "#000080", 0.5 "#ffffff", 0.7 "#ffc0c0", 0.8 "#ff0000", 1 "#200000")
#set palette defined (0 "#000020", 0.2 "#202080", 0.5 "#ffffff", 0.7 "#ffc0c0", 1 "#ff0000")
#set palette rgbformulae 33,13,10
set palette defined (0 "#000020", 0.2 "#0000ff", 0.33 "#00c0c0", 0.67 "#f0f000", 0.75 "#ffc000", 1 "#ff0000")
set pm3d interpolate 3,3



## Contour
set contour base
set cntrparam bspline
set cntrparam level incremental 3, 4, 18
set linetype 1 lc rgb 'black' lw 2
set linetype 2 lc rgb 'black' lw 2
set linetype 3 lc rgb 'black' lw 2
set linetype 4 lc rgb 'black' lw 2
set linetype 5 lc rgb 'black' lw 1
set linetype 6 lc rgb 'black' lw 1
set linetype 7 lc rgb 'black' lw 2
set linetype 8 lc rgb 'black' lw 2
set linetype 9 lc rgb 'black' lw 2
set linetype 10 lc rgb 'black' lw 2
set linetype 11 lc rgb 'black' lw 2
set linetype 12 lc rgb 'black' lw 2
set linetype 13 lc rgb 'black' lw 2
set linetype 14 lc rgb 'black' lw 2
#set linetype 15 lc rgb 'black' lw 2
#set linetype 16 lc rgb 'black' lw 2
#set linetype 17 lc rgb 'black' lw 2
#set linetype 18 lc rgb 'black' lw 2
#set linetype 19 lc rgb 'black' lw 2

set output outFile
splot dataFile with pm3d notitle lt 1
set output

#unset multiplot
set output outFile1
splot dataFile with pm3d notitle lt 1
set output
