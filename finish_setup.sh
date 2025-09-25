#!/bin/bash

cd ~/rosflight_ws
rosdep install --from-paths . --ignore-src -y
colcon build

add_to_bashrc() {
    echo "$1" >> ~/.bashrc
}

add_to_bashrc 'export ROS_DOMAIN_ID=13'

# I refuse to go without these
add_to_bashrc 'alias c="clear"'
add_to_bashrc 'alias py="python3"'
add_to_bashrc 'alias r2r="ros2 run"'
add_to_bashrc 'alias r2l="ros2 launch"'
add_to_bashrc 'alias r2t="ros2 topic"'
add_to_bashrc 'alias r2tl="ros2 topic list"'
add_to_bashrc 'alias r2te="ros2 topic echo"'
add_to_bashrc 'alias cb="colcon build"'
add_to_bashrc 'alias ccbr2l="clear && colcon build && ros2 launch"'
add_to_bashrc 'alias ccbr2r="clear && colcon build && ros2 run"'

source ~/.bashrc