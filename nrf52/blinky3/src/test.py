import machine
import time

led = machine.Pin(2, machine.Pin.OUT)
on = 0

while(1)
	on = (on+1)%2
	time.sleep_ms(300)
	if on == 1
		led.high()
	else
		led.low()

