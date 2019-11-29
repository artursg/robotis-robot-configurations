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
ROB2_DYN="https://github.com/ROBOTIS-GIT/DynamixelSDK"
ROB2_FR="https://github.com/ROBOTIS-GIT/ROBOTIS-Framework"
ROB2_FRM="https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs"
ROB2_MA="https://github.com/ROBOTIS-GIT/ROBOTIS-Math"
ROB2_CO="https://github.com/ROBOTIS-GIT/ROBOTIS-OP2-Common"
ROB2_P3="https://github.com/ROBOTIS-GIT/ROBOTIS-OP3"
TF="https://github.com/ros/geometry.git"
ROB2_P3T="https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools"
ROB2_P3M="https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs.git"
ARRAY=($ROB2_DYN $ROB2_FR $ROB2_FRM $ROB2_CO $ROB2_MA $ROB2_P3 $TF $ROB2_P3M $ROB2_P3T)
echo -e "${BLUE}****START CLONING GIT****${NC}"
for i in "${ARRAY[@]}"
do
    git clone $i
done
apt-get -y install libyaml-cpp-dev
apt-get -y install libeigen3-dev
apt-get -y install ros-kinetic-rqt-common-plugins
apt-get -y install ros-kinetic-orocos-kdl
cd ..
if catkin_make; then
    echo -e "${GREEN}*****CATKIN_MAKE ROBOTIS succeeded*****${NC}"
else
    echo -e "${RED}*****FAILED CATKIN_MAKE ROBOTIS*****${NC}"
fi
echo -e "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
echo -e "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo -e "${GREEN}*****ADDED TO BASHRC ENVIRONMENT SETUP*****${NC}"
echo -e "${PURPLE}*****EXIT BASH SCRIPT. CHECK PACKAGES IN BASH TERMINAL*****${NC}"