#!/bin/bash

# Read input from the pipe
input=$(cat)

# Check the input and perform different actions based on it
if [ "$input" = "bw+dither" ]; then
    dbus-send --system --dest=org.pinenote.ebc --print-reply /ebc  org.pinenote.ebc.SetBwMode byte:1  
    dbus-send --system --dest=org.pinenote.ebc --print-reply /ebc  org.pinenote.ebc.SetDefaultWaveform byte:1
    # This might happen automatically? 
    dbus-send --system --print-reply --dest=org.pinenote.ebc /ebc org.pinenote.ebc.TriggerGlobalRefresh
elif [ "$input" = "greyscale" ]; then
    dbus-send --system --dest=org.pinenote.ebc --print-reply /ebc  org.pinenote.ebc.SetBwMode byte:0  
    dbus-send --system --dest=org.pinenote.ebc --print-reply /ebc  org.pinenote.ebc.SetDefaultWaveform byte:4
    # This might happen automatically? 
    dbus-send --system --print-reply --dest=org.pinenote.ebc /ebc org.pinenote.ebc.TriggerGlobalRefresh
else
    echo "Input not recognized"
fi
