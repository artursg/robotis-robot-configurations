#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
echo -e "${BLUE}*****STARTING BASH SCRIPT! MAINTAINER : ${PURPLE}SHABALINA KSENIIA*****${NC}"
echo -e "${BLUE}*****ENVIRONMENT SETUP*****${NC}"
source /opt/ros/kinetic/setup.bash
apt-get update
echo -e "${BLUE}*****INSTALL DEPS FROM http://wiki.ros.org/kinetic/Installation/Ubuntu*****${NC}"
apt-get -y install python-rosinstall
apt-get -y install python-rosinstall-generator
apt-get -y install python-wstool build-essential
echo -e "${GREEN}*****END DEPS*****${NC}"
cd ~/catkin_ws
if catkin_make; then
    echo -e "${GREEN}*****CATKIN_MAKE succeeded*****${NC}"
else
    echo -e "${RED}*****CATKIN_MAKE failed*****${NC}"
fi
source devel/setup.bash
rm -rf build devel
source ~/.bashrc
cd src
ROB3="https://github.com/ROBOTIS-GIT/ROBOTIS-OP3.git"
TF="https://github.com/ros/geometry.git"
ROB2_P3M="https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs.git"
ROB3_F="https://github.com/ROBOTIS-GIT/ROBOTIS-Framework.git"
GEO_TF2="https://github.com/ros/geometry2.git"
ARRAY=($ROB3 $TF $ROB3_F $ROB2_P3M $GEO_TF2)
echo -e "${BLUE}****START CLONING GIT****${NC}"

for i in "${ARRAY[@]}"
do
    git clone $i
done

apt-get -y install ros-kinetic-rqt-common-plugins
apt-get -y install ros-kinetic-robotis-math
apt-get -y install ros-kinetic-robotis-controller-msgs
apt-get -y install ros-kinetic-orocos-kdl
apt-get -y install libyaml-cpp-dev
apt-get -y install ros-kinetic-angles
apt-get -y install ros-kinetic-dynamixel-sdk
apt-get -y install ros-kinetic-tf2-bullet
cd ..
rosdep install --from-paths WORKSPACE --ignore-src --rosdistro=kinetic
if catkin_make; then
    echo -e "${GREEN}*****CATKIN_MAKE ROBOTIS succeeded*****${NC}"
else
    echo -e "${RED}*****FAILED CATKIN_MAKE ROBOTIS*****${NC}"
fi
echo -e "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
echo -e "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo -e "${GREEN}*****ADDED TO BASHRC ENVIRONMENT SETUP*****${NC}"
echo -e "${PURPLE}*****EXIT BASH SCRIPT. CHECK PACKAGES IN BASH TERMINAL*****${NC}"