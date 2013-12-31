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

Base and inspiration for technical design and source code is from http://blog.turningdigital.com/2012/09/raspberry-pi-ds18b20-temperature-sensor-rrdtool/

This code works on any platform with http-server, Perl, PHP5 and RRDTools. I used Raspberry Pi with Debian Wheezy minimal distribution. The temperature data is collected by Perl-script and alarm data by Python-script. Graphs are generated by bash-script running several RRDTool-commands. get_temp.pl takes the readings from sensors and other logged sources, values are appended to the rrd-database and last values are written to last_temp.log for debugging purposes and fetching latest measurements to php-page. create_craphs.sh plots new graphs from the local RRD-database. check_alarm.py reads the state of GPIO-pin and updates the alarm_state.log. This log is read by get_alarm.py, that updates the alarm-database.

The UI is based on PHP-site, that displays RRDTOOL's graphs and reads current state of alarm-input from alarm_state.log that is updated by check_alarm.py. This Python-script has to be run by root, as it needs access to host memory registers.

INSTALLATION:
1. Install and configure the http-server and other depencies listed above.
2. Copy the code by git clone or downloading it as zip-file to your http-server docroot.
3. Append the following line to the end of /etc/crontab: */5 *   * * *   root    cd /var/www/temp_server; ./runme.sh
	- Change the "var/www/temp_server" to the path of where the temp_server-code resides.
	- You can adjust the sample frequency by changing the "*/5 *  * * *"-setting. This current setting means that measurements are taken every five minutes. Below are some examples of how the cron timing works.
	- "*/10 *" = every 10 minutes
	- "* *" = every minute
	- "5 *" = five minutes past every hour
	- "00 01" = every day at one o'clock 
	- "15 12  1 * *" = every first day of the month, at 12:15
	- "15 12  * * 0" = every sunday at 12:15
	- "15 12  * */2 *" = every other month, each day at 12:15

