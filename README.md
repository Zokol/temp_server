temp_server
===========

Temperature logging server for Raspberry Pi

Base for technical design and source code is from http://blog.turningdigital.com/2012/09/raspberry-pi-ds18b20-temperature-sensor-rrdtool/

This code works on any platform with http-server, Perl, PHP5 and RRDTools. I used Raspberry Pi with Debian Wheezy minimal distribution.

To get the scripts running, add symbolic links of create_graphs.sh and get_temp.pl to /etc/cron.hourly. get_temp.pl takes the readings from sensors and other logged sources. create_craphs.sh plots new graphs from the local RRD-database.
