#!/bin/bash

echo "This script will create an orocos_ws in your robotology_superbuild folder."

cd $ROBOTOLOGY_ROOT
mkdir orocos_ws
cd orocos_ws

catkin_init_workspace

export GIT_SSL_NO_VERIFY=1
git clone --recursive -b toolchain-2.7 https://github.com/orocos-toolchain/orocos_toolchain.git src
cd src
git clone https://github.com/orocos/rtt_geometry.git
git clone https://github.com/orocos/rtt_ros_integration.git
cd ..

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$ROBOTOLOGY_ROOT/orocos_ws/src

sudo apt-get install ruby ruby-dev
sudo apt-get install libomniorb4-dev omniorb-idl omniorb omniorb-nameserver omniidl
sudo gem install rake hoe

sudo rosdep init
rosdep update

rosdep install orocos_toolchain

source src/env.sh
catkin_make_isolated --install -DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB
catkin_make_isolated --install --pkg rtt_geometry
catkin_make_isolated --install --pkg eigen_typekit
catkin_make_isolated --install --pkg kdl_typekit

catkin_make_isolated --install --pkg rtt_ros
catkin_make_isolated --install --pkg rtt_rosnode
catkin_make_isolated --install --pkg rtt_roscomm
catkin_make_isolated --install --pkg rtt_rosclock
catkin_make_isolated --install --pkg utilrb
catkin_make_isolated --install --pkg rtt_sensors_msgs
catkin_make_isolated --install --pkg rtt_trajectory_msgs




