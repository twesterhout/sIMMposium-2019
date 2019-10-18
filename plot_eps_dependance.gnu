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
set bmargin 4
set lmargin 2
set rmargin 4

# Grid
set style line 12 lc rgb'#CCCCCC' lt 0 lw 4
set grid ls 12

set key left at graph 0.005, 1.02 spacing 2.25 width -5.0
set xtics offset 0,-0.7 (\
    '{\color[rgb]{0.5,0.5,0.5}\small $0$}' 0, \
    '{\color[rgb]{0.5,0.5,0.5}\small $10^{-4}$}' 1e-4, \
    '{\color[rgb]{0.5,0.5,0.5}\small $10^{-3}$}' 1e-3, \
    '{\color[rgb]{0.5,0.5,0.5}\small $10^{-2}$}' 1e-2, \
    '{\color[rgb]{0.5,0.5,0.5}\small $10^{-1}$}' 1e-1)
set xlabel '\small $\varepsilon$' offset 0,-2.0
set logscale x
set ytics offset -2.5, 0.1 format '{\color[rgb]{0.5,0.5,0.5}\small $%.1f$}'
set ylabel '\small overlap' offset 9,0

set terminal epslatex input newstyle colour size 21cm, 17cm
set output "eps_dependance.tex"

set object 3 rect from graph 0.59, 0.43 to graph 0.94, 0.55
set object 3 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set label 1 '\color[rgb]{0.5, 0.5, 0.5}\small (Kagome lattice)' front at graph 0.60, 0.49
plot[:0.102][0:1.02] \
        "<(grep '^0.40' data/kagome/f_dependence/quadratic/phase/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 2 pt 7 lw 8 ps 1.5 title '\scriptsize $N=24$, $J_2/J_1 = 0.4$', \
        "<(grep '^0.50' data/kagome/f_dependence/quadratic/phase/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 3 pt 7 lw 8 ps 1.5 title '\scriptsize $N=24$, $J_2/J_1 = 0.5$', \
        "<(grep '^0.60' data/kagome/f_dependence/quadratic/phase/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 7 pt 7 lw 8 ps 1.5 title '\scriptsize $N=24$, $J_2/J_1 = 0.6$', \
        "<(grep '^1.00' data/kagome/f_dependence/quadratic/phase/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 5 pt 7 lw 8 ps 1.5 title '\scriptsize $N=24$, $J_2/J_1 = 1.0$', \
        "<(grep '^0.40' data/kagome/f_dependence/quadratic/phase/30/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 1 pt 7 lw 6 ps 1.5 title '\color[rgb]{0.6, 0.6, 0.6}\scriptsize $N=30$, $J_2/J_1 = 0.4$', \
        "<(grep '^1.00' data/kagome/f_dependence/quadratic/phase/30/data.dat | sort -g -k2)" \
            u 2:21 with lp ls 8 pt 7 lw 6 ps 1.5 title '\color[rgb]{0.6, 0.6, 0.6}\scriptsize $N=30$, $J_2/J_1 = 1.0$'

set output


