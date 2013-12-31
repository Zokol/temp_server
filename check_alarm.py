import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

f = open("alarm_state.log", 'w')

GPIO.setup(17, GPIO.IN)
alarm = GPIO.input(17)

print alarm

if(alarm == True):
	print 1
else:
	print 0

f.write(str(alarm) + "\n")
f.close()
