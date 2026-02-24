#!/bin/bash

if (( $# != 3 )); then
    echo "Usage: $0 logFile dcdFreq timestep"
    exit
fi


f=$1
dcdFreq=$2
timestep=$3

dt=$( perl -e "print $dcdFreq*$timestep;" )
fn=${f%.*}
echo "FRAMETIME $dt"

grep "^ENERGY: " $f | awk "{print $dt*\$2,\$7}" > $fn.elect.dat
grep "^ENERGY: " $f | awk "{print $dt*\$2,\$8}" > $fn.vdw.dat
grep "^ENERGY: " $f | awk "{print $dt*\$2,\$12}" > $fn.total.dat
grep "^ENERGY: " $f | awk "{print $dt*\$2,\$14}" > $fn.pot.dat
