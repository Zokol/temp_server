#!/usr/bin/python
import paramiko
import ftplib
import os
import sys
import traceback
from commands import getstatusoutput
 
GRAPH_DIR = '/home/pi/Programming/Temp/'
DATA_DIR = '/tmp/'
 
#generate graphs
#getstatusoutput(GRAPH_DIR + 'create_graphs.sh')
 
#ssh = paramiko.SSHClient()
#ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
#ssh.connect('infortech@server7.nettihotelli.fi', port=, username='your_username', password='your_password')
 
#sftp = ssh.open_sftp();
#sftp.put(DIR + '/temp_hourly.png', 'rpi_temp/temp_hourly.png')
#sftp.put(DIR + '/temp_daily.png', 'rpi_temp/temp_daily.png')
#sftp.put(DIR + '/temp_weekly.png', 'rpi_temp/temp_weekly.png')
#sftp.put(DIR + '/temp_monthly.png', 'rpi_temp/temp_monthly.png')
#sftp.put(DIR + '/temp_yearly.png', 'rpi_temp/temp_yearly.png')
#sftp.close()

def upload(fullname):	
        print "Uploading ", fullname
        name = os.path.split(fullname)[1]
        f = open(fullname, "rb")
        ftp.storbinary('STOR ' + name, f)
        f.close()
        print "OK"

print "Logging in..."
ftp = ftplib.FTP()
ftp.connect('server7.nettihotelli.fi')
print ftp.getwelcome()
try:
    try:
        ftp.login('raspi_temp', 'tJn4bDHipah91S1')
        ftp.cwd('/')
        # move to the desired upload directory
        print "Currently in:", ftp.pwd()

	upload(GRAPH_DIR + 'temp_hourly.png')
	upload(GRAPH_DIR + 'temp_daily.png')    
	upload(GRAPH_DIR + 'temp_weekly.png')
	upload(GRAPH_DIR + 'temp_monthly.png')
	upload(GRAPH_DIR + 'temp_yearly.png')

	upload(DATA_DIR + 'last_temp.log')
	upload(DATA_DIR + 'alarm_state.log')
	upload(DATA_DIR + 'temp.log')
 
        print "Files:"
        print ftp.retrlines('LIST')
    finally:
        print "Quitting..."
        ftp.quit()
except:
    traceback.print_exc()
