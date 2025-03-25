#!/bin/bash

 # --- for every Terminal-tab
 # source /home/xps/anaconda3/bin/activate ur_env
 cd ~/NeuralSymbol_AI
 source devel/setup.bash
 

{
	gnome-terminal --tab "task1_init" -- bash -c "rosrun ur_control task1.py;exec bash"
}&

echo "task1 initialized!"
