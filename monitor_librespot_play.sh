#!/bin/bash

gpiopin=18

echo "$gpiopin" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$gpiopin/direction

while :
do
        status=`journalctl -u raspotify.service | grep -o "command=Load\|command=Stop\|command=Pause\|command=Play" | sed '$!d'`
        if [ $status = "command=Load" ]
                then
                        echo "1" > /sys/class/gpio/gpio$gpiopin/value
                elif [ $status = "command=Stop"  ]
                        then
                                echo "0" > /sys/class/gpio/gpio$gpiopin/value
                elif [ $status = "command=Pause" ]
                        then
                                echo "1" > /sys/class/gpio/gpio$gpiopin/value
                                sleep 1
                                echo "0" > /sys/class/gpio/gpio$gpiopin/value
                                sleep 1
                elif [ $status = "command=Play" ]
                        then
                                echo "1" > /sys/class/gpio/gpio$gpiopin/value
        fi
done
