#!/bin/bash
DIR="."
 
#set to C if using Celsius
TEMP_SCALE="C"
 
#define the desired colors for the graphs
INTEMP_COLOR="#550000"
OUTTEMP_COLOR="#0000FF"
ALARM_COLOR="#FF0000"

date
 
#hourly
rrdtool graph $DIR/temp_hourly.png \
 --imgformat PNG --width 350 --height 200\
 --title "Hourly" \
 --vertical-label "Inside" \
 --right-axis 1:-25 \
 --right-axis-label "Outside" \
DEF:alarm=$DIR/alarm.rrd:alarm:AVERAGE \
CDEF:alarm2=alarm,50,* \
AREA:alarm2$ALARM_COLOR:"Alarm state [boolean]" \
DEF:temp=$DIR/hometemp.rrd:temp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR/hometemp.rrd:outtemp:AVERAGE \
CDEF:outtemp2=outtemp,25,+ \
LINE1:outtemp2$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
 
#daily
rrdtool graph $DIR/temp_daily.png --start -1d \
 --imgformat PNG --width 350 --height 200\
 --title "Daily" \
 --vertical-label "Inside" \
 --right-axis 1:-25 \
 --right-axis-label "Outside" \
DEF:alarm=$DIR/alarm.rrd:alarm:AVERAGE \
CDEF:alarm2=alarm,50,* \
AREA:alarm2$ALARM_COLOR:"Alarm state [boolean]" \
DEF:temp=$DIR/hometemp.rrd:temp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR/hometemp.rrd:outtemp:AVERAGE \
CDEF:outtemp2=outtemp,25,+ \
LINE1:outtemp2$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
 
#weekly
rrdtool graph $DIR/temp_weekly.png --start -1w \
 --imgformat PNG --width 350 --height 200\
 --title "Weekly" \
 --vertical-label "Inside" \
 --right-axis 1:-25 \
 --right-axis-label "Outside" \
DEF:alarm=$DIR/alarm.rrd:alarm:AVERAGE \
CDEF:alarm2=alarm,50,* \
AREA:alarm2$ALARM_COLOR:"Alarm state [boolean]" \
DEF:temp=$DIR/hometemp.rrd:temp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR/hometemp.rrd:outtemp:AVERAGE \
CDEF:outtemp2=outtemp,25,+ \
LINE1:outtemp2$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
 
#monthly
rrdtool graph $DIR/temp_monthly.png --start -1m \
 --imgformat PNG --width 350 --height 200\
 --title "Monthly" \
 --vertical-label "Inside" \
 --right-axis 1:-25 \
 --right-axis-label "Outside" \
DEF:alarm=$DIR/alarm.rrd:alarm:AVERAGE \
CDEF:alarm2=alarm,50,* \
AREA:alarm2$ALARM_COLOR:"Alarm state [boolean]" \
DEF:temp=$DIR/hometemp.rrd:temp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR/hometemp.rrd:outtemp:AVERAGE \
CDEF:outtemp2=outtemp,25,+ \
LINE1:outtemp2$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
 
#yearly
rrdtool graph $DIR/temp_yearly.png --start -1y \
 --imgformat PNG --width 350 --height 200\
 --title "Yearly" \
 --vertical-label "Inside" \
 --right-axis 1:-25 \
 --right-axis-label "Outside" \
DEF:alarm=$DIR/alarm.rrd:alarm:AVERAGE \
CDEF:alarm2=alarm,50,* \
AREA:alarm2$ALARM_COLOR:"Alarm state [boolean]" \
DEF:temp=$DIR/hometemp.rrd:temp:AVERAGE \
LINE2:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
DEF:outtemp=$DIR/hometemp.rrd:outtemp:AVERAGE \
CDEF:outtemp2=outtemp,25,+ \
LINE1:outtemp2$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]"
