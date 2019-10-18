#!/usr/bin/env gnuplot

# line styles for ColorBrewer Dark2
# for use with qualitative/categorical data
# provides 8 dark colors based on Set2
# compatible with gnuplot >=4.2
# author: Anna Schneider

# line styles
set style line 1 lt 1 lc rgb '#1B9E77' # dark teal
set style line 2 lt 1 lc rgb '#D95F02' # dark orange
set style line 3 lt 1 lc rgb '#7570B3' # dark lilac
set style line 4 lt 1 lc rgb '#E7298A' # dark magenta
set style line 5 lt 1 lc rgb '#66A61E' # dark lime green
set style line 6 lt 1 lc rgb '#E6AB02' # dark banana
set style line 7 lt 1 lc rgb '#A6761D' # dark tan
set style line 8 lt 1 lc rgb '#666666' # dark gray

# palette
set palette maxcolors 8
set palette defined ( 0 '#1B9E77',\
                      1 '#D95F02',\
                      2 '#7570B3',\
                      3 '#E7298A',\
                      4 '#66A61E',\
                      5 '#E6AB02',\
                      6 '#A6761D',\
                      7 '#666666' )

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11 lw 2
set tics nomirror out scale 0.9
set arrow from graph 1,0 to graph 1.05,0 size screen 0.02,15,60 filled ls 11
set arrow from graph 0,1 to graph 0,1.05 size screen 0.02,15,60 filled ls 11
set tmargin 2
set bmargin 6
set lmargin 2
set rmargin 4

# Grid
set style line 12 lc rgb'#CCCCCC' lt 0 lw 4
set grid ls 12

set key left at graph 0.2, 0.24 spacing 2.0 width -5.0
set xtics offset 0,-0.5 format '{\color[rgb]{0.5,0.5,0.5}\small $%.1f$}'; set xlabel '\small $J_2/J_1$' offset 0,-2.0
set ytics offset -2.5, 0.1 format '{\color[rgb]{0.5,0.5,0.5}\small $%.1f$}'; set ylabel '\small overlap' offset 9,0

set terminal epslatex input newstyle colour size 20cm, 17cm
set output "amp_vs_sign.tex"

set object 1 rect from graph 0.05, 0.10 to graph 0.38, 0.25
set object 1 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set object 2 rect behind from 0.52, 0 to 1.0, 1.0
set object 2 rect fc rgb '#808080' fillstyle transparent solid 0.2 noborder
set object 3 rect from graph 0.09, 0.43 to graph 0.44, 0.55
set object 3 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set label 1 '\color[rgb]{0.5, 0.5, 0.5}\small (Kagome lattice)' front at graph 0.10, 0.49
plot[0:1.02][0:1.02] "data/kagome/j2_dependence/quadratic/amplitude/dense_64_ReLU_64_ReLU_1/data.dat" \
        u 1:21 with lp ls 2 pt 7 lw 8 ps 1.5 title '\footnotesize amplitudes', \
     "data/kagome/j2_dependence/quadratic/phase/dense_64_ReLU_64_ReLU_2/data.dat" \
        u 1:21 with lp ls 5 pt 7 lw 8 ps 1.5 title '\footnotesize signs'

set output

