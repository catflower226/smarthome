noise = 0
led.enable(False)
smarthome.crash_sensor_setup(DigitalPin.P4)

def on_forever():
    global noise
    if smarthome.crash_sensor():
        pins.servo_write_pin(AnalogPin.P1, 180)
        basic.pause(2000)
        pins.servo_write_pin(AnalogPin.P1, 0)
        basic.pause(1000)
        noise = smarthome.read_noise(AnalogPin.P2)
    if noise >= 70:
        smarthome.motor_fan(AnalogPin.P3, True, 20)
        basic.pause(5000)
        smarthome.motor_fan(AnalogPin.P3, False, 0)
basic.forever(on_forever)
