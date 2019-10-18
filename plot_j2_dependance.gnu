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
set arrow from graph 1,0 to graph 1.05,0 size screen 0.01,15,60 filled ls 11
set arrow from graph 0,1 to graph 0,1.05 size screen 0.01,15,60 filled ls 11
set tmargin 2

# Grid
set style line 12 lc rgb'#CCCCCC' lt 0 lw 4
set grid ls 12

set terminal epslatex input newstyle colour size 58cm, 17cm
set output "j2_dependance.tex"

m_l_offset = 0.04
m_r_offset = 0.1
m_sep = 0.04
m_width = (1 - 2 * m_sep - m_l_offset - m_r_offset) / 3.0

set key left at graph 0.16, 0.27 spacing 2.0 width -5.0
set xtics offset 0,-0.6 format '{\color[rgb]{0.5,0.5,0.5}\small $%.1f$}'
set xlabel '\small $J_2/J_1$' offset 0,-2.0

### Begin multiplot
set multiplot layout 1,3 rowsfirst

# --- Square lattice
set key left at graph -0.04, 0.30 spacing 2.0 width -5.0
set ytics offset -2.5, 0.2 format '{\color[rgb]{0.5,0.5,0.5}\small $%.1f$}'
set ylabel '\small overlap' offset 9.0,0
set lmargin at screen m_l_offset; set rmargin at screen m_l_offset + m_width
set object 2 rect behind from 0.4, 0 to 0.6, 1.0
set object 2 rect fc rgb '#808080' fillstyle transparent solid 0.2 noborder
set object 1 rect from graph 0.01, 0.01 to graph 0.52, 0.30
set object 1 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set label 1 '\small Square lattice' at graph 0.5, 1.05 center
plot[0:1.02][0:1.02] "data/square/j2_dependence/dense_64_ReLU_2_phase/data.dat" \
        u 1:(2 * $13 - 1) with lp ls 2 pt 7 lw 8 ps 1.5 title '\footnotesize 1-layer dense', \
     "data/square/j2_dependence/dense_64_ReLU_64_ReLU_2_phase/data.dat" \
        u 1:(2 * $13 - 1) with lp ls 5 pt 7 lw 8 ps 1.5 title '\footnotesize 2-layer dense', \
     "data/square/j2_dependence/conv_model_phase_small/data.dat" \
        u 1:(2 * $13 - 1) with lp ls 3 pt 7 lw 8 ps 1.5 title '\footnotesize small CNN', \
     "data/square/j2_dependence/conv_model_phase/data.dat" \
        u 1:(2 * $13 - 1) with lp ls 4 pt 7 lw 8 ps 1.5 title '\footnotesize CNN', \
     "<(sort -g -k1 data/square/j2_dependence/30_dense_64_ReLU_64_ReLU_2_phase/data.dat)" \
        u 1:(2 * $13 - 1) with lp ls 8 pt 7 lw 6 ps 1.5 title '\color[rgb]{0.6, 0.6, 0.6}\scriptsize N=30, 2-layer dense'

# --- Triangular lattice
set key left at graph 0.2, 0.27 spacing 2.0 width -5.0
set ytics format ''; unset ylabel; unset xlabel
set lmargin at screen m_l_offset + m_sep + m_width; set rmargin at screen m_l_offset + m_sep + 2 * m_width
set bmargin at screen 0.125

set xtics 0.0, 0.4
set object 1 rect from graph 0.02, 0.15 to graph 0.44, 0.29
set object 1 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set object 2 rect behind from 1.25, 0 to 2.0, 1.0
set object 2 rect fc rgb '#808080' fillstyle transparent solid 0.2 noborder
set label 1 '\small Triangular lattice' at graph 0.5, 1.05 center
plot[0:1.65][0:1.02] "<(sort -g -k1 data/triangle/dense_64_ReLU_2/data.dat)" \
        u 1:(2 * $13 - 1) with lp ls 2 pt 7 lw 8 ps 1.5 title '\footnotesize 1-layer dense', \
            "<(sort -g -k1 data/triangle/dense_64_ReLU_64_ReLU_2/data.dat)" \
        u 1:(2 * $13 - 1) with lp ls 5 pt 7 lw 8 ps 1.5 title '\footnotesize 2-layer dense'


# --- Kagome lattice
set lmargin at screen m_l_offset + 2 * m_sep + 2 * m_width; set rmargin at screen 1.0 - m_r_offset
set xtics 0.0, 0.2
set object 1 rect from graph 0.02, 0.15 to graph 0.44, 0.29
set object 1 rect fc rgb '#222222' fillstyle solid 0.0 noborder
set object 2 rect behind from 0.52, 0 to 1.0, 1.0
set object 2 rect fc rgb '#808080' fillstyle transparent solid 0.2 noborder
set label 1 '\small Kagome lattice' at graph 0.5, 1.05 center
plot[0:1.02][0:1.02] "data/kagome/j2_dependence/quadratic/phase/dense_64_ReLU_2/data.dat" \
        u 1:21 with lp ls 2 pt 7 lw 8 ps 1.5 title '\footnotesize 1-layer dense', \
     "data/kagome/j2_dependence/quadratic/phase/dense_64_ReLU_64_ReLU_2/data.dat" \
        u 1:21 with lp ls 5 pt 7 lw 8 ps 1.5 title '\footnotesize 2-layer dense'


unset multiplot
### End multiplot

set output
