#!/bin/sh
awk "BEGIN{printf (\"%d mA, %d mV, %3.1f °C\n\", $(cat /sys/bus/iio/devices/iio:device0/in_current0_raw) * $(cat /sys/bus/iio/devices/iio:device0/in_current0_scale), $(cat /sys/bus/iio/devices/iio:device0/in_voltage1_raw) * $(cat /sys/bus/iio/devices/iio:device0/in_voltage1_scale),  $(cat /sys/bus/i2c/devices/i2c-1/1-003c/device_temperature))}"

