#!/usr/bin/python
import paramiko
import ftplib
import os
import sys
import traceback
from commands import getstatusoutput
 
DIR = '.'
 
#generate graphs
#getstatusoutput(DIR + 'create_graphs.sh')
 
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('juva.lu', username='pi')
 
sftp = ssh.open_sftp()
sftp.put(DIR + '/temp_hourly.png', 'hake_temp/temp_hourly.png')
sftp.put(DIR + '/temp_daily.png', 'hake_temp/temp_daily.png')
sftp.put(DIR + '/temp_weekly.png', 'hake_temp/temp_weekly.png')
sftp.put(DIR + '/temp_monthly.png', 'hake_temp/temp_monthly.png')
sftp.put(DIR + '/temp_yearly.png', 'hake_temp/temp_yearly.png')
sftp.put(DIR + '/last_temp.log', 'hake_temp/last_temp.log')
sftp.put(DIR + '/alarm_state.log', 'hake_temp/alarm_state.log')
sftp.close()
ssh.close()
