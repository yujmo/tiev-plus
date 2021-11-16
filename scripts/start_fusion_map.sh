#!/bin/bash
export ZCM_DEFAULT_URL='ipc'
cd /home/tiev-plus/tiev-plus-lidar/modules/src/lidar/build/ && ./lidar &
cd /home/tiev-plus/huace_driver_nav/build/ && ./huace_driver &
cd /home/tiev-plus/tiev-plus-fusion-map/modules/src/map_fusion/build/ && ./map_fusion &
zcm-spy-peek -u ipc
pkill lidar
pkill huace_driver
pkill map_fusion
