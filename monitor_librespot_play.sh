#!/bin/bash

#Let's initialize GPIO First:

gpiopin=18

echo "$gpiopin" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction

while :
do
        status=`journalctl -u raspotify.service | grep -o "command=Load\|command=Stop" | sed '$!d'`
        if [ $status = "command=Load" ]
                then
                        echo "1" > /sys/class/gpio/gpio$gpiopin/value
                elif [ $status = "command=Stop"  ]
                        then
                                echo "0" > /sys/class/gpio/gpio$gpiopin/value
        fi
done
