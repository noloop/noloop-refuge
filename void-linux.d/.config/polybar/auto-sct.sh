#!/bin/bash
hour=$(date '+%H')
if [ $hour -ge 17 ]
then
    sct 4800
else
    sct
fi
