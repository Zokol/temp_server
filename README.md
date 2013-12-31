temp_server
===========

Temperature logging server for Raspberry Pi

Hardware: Raspberry Pi, DS18S20-sensor, NPN-transistor to detect alarm-input

Software: RRDTOOL, Python, PHP, Perl

Program is configured to read two temperature values, one from DS18S20 connected to the Raspberry-device, other from globally used aviation weather broadcast system. Currently the outside temperature is read from EFTU, located at southern coast of Finland. 

Base for technical design and source code is from http://blog.turningdigital.com/2012/09/raspberry-pi-ds18b20-temperature-sensor-rrdtool/

This code works on any platform with http-server, Perl, PHP5 and RRDTools. I used Raspberry Pi with Debian Wheezy minimal distribution.

To get the scripts running, add symbolic links of create_graphs.sh and get_temp.pl to /etc/cron.hourly. get_temp.pl takes the readings from sensors and other logged sources. create_craphs.sh plots new graphs from the local RRD-database.

The temperature graphs are generated based on measurements made by Perl-scripts. Graphs are generated periodically.

The UI is based on PHP-site, that displays RRDTOOL's graphs and reads current state of alarm-input from /tmp/alarm_state.log that is updated by check_alarm.py. This Python-script has to be run by root, as it needs access to host memory registers.
