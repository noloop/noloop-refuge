#!/bin/bash

killall -q polybar

echo "---" | tee -a /tmp/noloopbar.log

polybar noloopbar >>/tmp/noloopbar.log 2>&1 & disown

echo "Bars launched..."
