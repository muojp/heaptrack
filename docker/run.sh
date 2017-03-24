#!/bin/sh

service ssh start > /dev/null 2>&1
/noVNC/utils/launch.sh --vnc localhost:5900 > /dev/null 2>&1 &
/usr/bin/Xvfb :0 -screen 0 1332x896x24 -cc 4 -nolisten tcp > /dev/null 2>&1 &
x11vnc -display :0 -noipv6 -forever -geometry 1070x720 > /dev/null 2>&1 &
echo "===>  http://localhost:6080/"
while :
do
  DISPLAY=:0 heaptrack_gui > /dev/null 2>&1
  sleep 2
done