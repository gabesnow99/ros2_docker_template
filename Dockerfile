# Base docker image.
ARG ROS_DISTRO
FROM osrf/ros:${ROS_DISTRO}-desktop-full

# Update system
RUN apt update
RUN apt upgrade -y
RUN rosdep update

# Install ROS dependencies with rosdep dependencies and build packages
WORKDIR /root/ros2_ws
RUN rosdep install --from-paths . --ignore-src -y

#
RUN apt install vim -y

# Add source files to .bashrc for automatic sourcing
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc
RUN echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc
RUN echo "source /usr/share/gazebo/setup.sh" >> /root/.bashrc
# RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.zshrc
# RUN echo "source /root/ros2_ws/install/setup.bash" >> /root/.zshrc
# RUN echo "source /usr/share/gazebo/setup.sh" >> /root/.zshrc
ENTRYPOINT bash
