# raspotify-led
This is a small script to monitor raspotify activity and switch on-off an LED when music is played/stopped.

This obviously rely on https://github.com/dtcooper/raspotify as well as having verbose logging enabled.

# Install
- Download/Copy the script onto the Raspberry Pi into a folder of your choice. I use /home/pi/ 
- Edit the script and change the gpiopin=18 variable if needed. Note this is BCM form and need to match the GPIO pin where you have a 330Ohm resistor and LED connected to.
- Make the script executable with "chmod +x monitor_librespot_play.sh"
- Edit the "/etc/default/raspotify" file and add the verbose switch "-v" to one of the arguments. I've used this: BACKEND_ARGS="--backend alsa -v"
- Restart the raspotify service so that the change takes affect.
- Start the script with /home/pi/monitor_librespot_play.sh and start streaming music via spotify connect to the pi. The LED should light up. Stop the streaming and it should switch off.
