#!/bin/bash
case $1 in
	huace_driver)
		cd /tiev-plus/modules/src/slam/src/utility/huace_driver_nav/build && ./huace_driver;;
	can_module)
		cd /tiev-plus-code/tiev-plus-can-module/build && ./can_module;;
	lidar)
		cd /tiev-plus/modules/src/lidar/build && ./lidar;;
	prediction)
		cd /tiev-plus/modules/src/prediction/build && ./prediction;;
	map_fusion)
		cd /tiev-plus/modules/src/map_fusion/build && ./map_fusion;;
	planning)	
		cd /tiev-plus/modules/src/planning/ && bash start_planning.sh;;
	planning_visual)
		cd /tiev-plus/modules/src/planning/ && bash start_visualization.sh;;
	control)
		cd /tiev-plus/modules/src/control/build && ./control_module;;
	RoadMarkingDect)
		cd /tiev-plus/modules/src/vision/RoadMarkingDect && python3 road_marking_dect.py;;
	traffic_detect)
		cd /tiev-plus/modules/src/vision/vision_traffic_detect && bash start.sh;;
	*)
		echo "command is error, big shabi";;
esac 
