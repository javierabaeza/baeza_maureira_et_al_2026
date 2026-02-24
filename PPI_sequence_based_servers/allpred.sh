gawk '{a[$1][$2]++} END {for (i in a) for (j in a[i]) print i, j, a[i][j]}' Pred_{B,I,R}_5wp6.dat > Pred_count.dat
awk -v I=386 -v J=145 -f test2.awk Pred_count.dat > Pred_all.dat
sort -k3 Pred_all.dat > Pred_order.dat
gnuplot -e "filename='Pred_order.dat'" image2.gp 

