#!/usr/bin/perl
use LWP::UserAgent;
 
my $dir = '/home/pi/Programming/Temp';

$alarm_state = "";
$alarm_state = `sudo python $dir/check_alarm.py`;
$rrd = `/usr/bin/rrdtool update $dir/alarm.rrd N:$alarm_state`;

use POSIX qw(strftime);
$now_string = strftime "%a %b %e %H:%M:%S %Y", localtime;

print "Time: $now_string\n"; 
print "Alarm: $alarm_state\n";
