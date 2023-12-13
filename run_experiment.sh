#!/bin/bash

SESSION_NAME="AGR-Tracker"

# Create a new tmux session
tmux new-session -d -s "$SESSION_NAME"

# Execute the commands in each window
tmux send-keys -t "$SESSION_NAME:0" 'source ~/AGR-Tracker/devel/setup.bash; roslaunch mapping rviz_sim.launch' C-m
tmux new-window -t "$SESSION_NAME" 'sleep 2; source ~/AGR-Tracker/devel/setup.bash; roslaunch planning fake_target.launch'
tmux new-window -t "$SESSION_NAME" 'sleep 2; source ~/AGR-Tracker/devel/setup.bash; roslaunch planning simulation1.launch'
tmux new-window -t "$SESSION_NAME" 'sleep 2; source ~/AGR-Tracker/devel/setup.bash; ./sh_utils/pub_triger.sh'


# Attach to the tmux session
tmux attach-session -t "$SESSION_NAME"