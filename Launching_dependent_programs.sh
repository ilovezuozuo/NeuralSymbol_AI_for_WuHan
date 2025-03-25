#!/bin/bash

 # --- for every Terminal-tab
 # source /home/xps/anaconda3/bin/activate ur_env

source devel/setup.bash

{
	 terminator -e "roslaunch example_organization_ur_launch ex-ur10-1.launch;exec bash"
}&

sleep 5s

{
	 terminator -e "roslaunch ur10_moveit_config battery_sleeve.launch;exec bash"
}&

sleep 5s

{
	 terminator -e "roslaunch realsense2_camera rs_camera.launch align_depth:=true filters:=hole_filling;exec bash"
}&

sleep 3s

{
	 terminator -e "roslaunch easy_handeye publish.launch;exec bash"
}&

sleep 3s

{
	 terminator -e "cd src/Project/VGG;python true_np_server.py;exec bash"
}&

sleep 3s

{
	 terminator -e "cd src/Project/YOLO/YOLO_v5_detect;python YOLO_server.py;exec bash"
}&

sleep 3s

{
	 terminator -e "cd src/Project/VAE/VAE_detect;python vae_server.py;exec bash"
}&

sleep 3s



echo "task1 initialized!"
