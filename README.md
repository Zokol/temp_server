temp_server
===========

Temperature logging server for Raspberry Pi

Hardware: 
- Raspberry Pi (tested on B-model with 256Mb RAM)
- DS18S20-sensor
- NPN-transistor to detect alarm-input

Software:
- RRDTOOL
- Python 2.7
- Python RPi.GPIO 0.5 (https://pypi.python.org/pypi/RPi.GPIO)
- PHP 5
- Perl

Program is configured to read two temperature values, one from DS18S20 connected to the Raspberry-device, other from globally used aviation weather broadcast system. It also reads state of GPIO-pin on RPi, to determine alarm state. An NPN-transistor is connected to the input-pin, so that if the input voltage(alarm-signal) is higher than the VCC(3.3V), alarm is triggered and graph starts drawing red field from that point on. Currently the outside temperature is read from EFTU, located at southern coast of Finland. 

Base for technical design and source code is from http://blog.turningdigital.com/2012/09/raspberry-pi-ds18b20-temperature-sensor-rrdtool/

This code works on any platform with http-server, Perl, PHP5 and RRDTools. I used Raspberry Pi with Debian Wheezy minimal distribution. The temperature data is collected by Perl-script and alarm data by Python-script. Graphs are generated by bash-script running several RRDTool-commands.
To get the scripts running, add symbolic links of create_graphs.sh, get_alarm.pl and get_temp.pl to /etc/cron.hourly. get_temp.pl takes the readings from sensors and other logged sources. create_craphs.sh plots new graphs from the local RRD-database. check_alarm.py reads the state of GPIO-pin and updates the alarm.log. This log is read by get_alarm.py, that updates the alarm-database.

The UI is based on PHP-site, that displays RRDTOOL's graphs and reads current state of alarm-input from /tmp/alarm_state.log that is updated by check_alarm.py. This Python-script has to be run by root, as it needs access to host memory registers.
