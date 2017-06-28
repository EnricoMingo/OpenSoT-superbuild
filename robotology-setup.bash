#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))

export ROBOTOLOGY_ROOT

if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
    source $ROBOTOLOGY_ROOT/build/active_profile
else
    export ROBOTOLOGY_PROFILE=SIMULATION
fi

pathadd() {
    if [ -z ${!1} ]; then
        export $1=$2
    elif [ -d "$2" ] && [[ ! ${!1} =~ (^|:)$2(:|$) ]]; then
        export $1+=:$2
    fi
}

if [ -f /opt/ros/hydro/setup.bash ]; then
    source /opt/ros/hydro/setup.bash
fi


if [ -f /opt/ros/indigo/setup.bash ]; then
    source /opt/ros/indigo/setup.bash
fi

if [ -f /opt/ros/kinetic/setup.bash ]; then
    source /opt/ros/kinetic/setup.bash
fi

if [ -f ${ROBOTOLOGY_ROOT}/external/moveit/install/setup.bash ]; then
    source ${ROBOTOLOGY_ROOT}/external/moveit/install/setup.bash
fi

#orocos
if [ -f ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/setup.bash ]; then
       source ${ROBOTOLOGY_ROOT}/orocos_ws/install_isolated/setup.bash
       if [ -f ${ROBOTOLOGY_ROOT}/orocos_ws/src/env.sh ]; then
              source ${ROBOTOLOGY_ROOT}/orocos_ws/src/env.sh
       fi
       export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/orocos_ws/install_isolated/lib:$LD_LIBRARY_PATH
       export LIBRARY_PATH=$ROBOTOLOGY_ROOT/orocos_ws/install_isolated/lib:$LIBRARY_PATH
       pathadd RTT_COMPONENT_PATH /opt/ros/${ROS_DISTRO}/lib/orocos/gnulinux/ocl  
       pathadd RTT_COMPONENT_PATH /opt/ros/${ROS_DISTRO}/lib/orocos/gnulinux/plugins  
       pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos

       if [ -f ${ROBOTOLOGY_ROOT}/external/rtt-gazebo-lwr4plus-sim/CMakeLists.txt ]; then
              pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/external/rtt-gazebo-lwr4plus-sim/orocos
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/robots/cogimon-gazebo-models/database.config ]; then
              pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/cogimon-gazebo-models
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/external/rtt-gazebo-clock-plugin/CMakeLists.txt ]; then
              pathadd GAZEBO_PLUGIN_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/rtt_gazebo_system
       fi           
       
       if [ -f ${ROBOTOLOGY_ROOT}/external/orocos_ros_joint_state_publisher/CMakeLists.txt ]; then   
		if [ ${OROCOS_TARGET}='xenomai' ]; then 	
			pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/xenomai/orocos_ros_joint_state_publisher
		else
       		pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/orocos_ros_joint_state_publisher
		fi
       fi 
       
       if [ -f ${ROBOTOLOGY_ROOT}/robots/rtt_coman/CMakeLists.txt ]; then
		if [ ${OROCOS_TARGET}='xenomai' ]; then 	
			pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/xenomai/rtt_coman
		else
       		pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/rtt_coman
		fi
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/external/ros_orocos_joints_gui/CMakeLists.txt ]; then
                if [ ${OROCOS_TARGET}='xenomai' ]; then 	
			pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/xenomai/ros_orocos_joints_gui
		else
       		pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/ros_orocos_joints_gui
		fi
       fi

       if [ -f ${ROBOTOLOGY_ROOT}/external/ros_orocos_joint_trajectory_server/CMakeLists.txt ]; then
                if [ ${OROCOS_TARGET}='xenomai' ]; then 	
			pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/xenomai/ros_orocos_joint_trajectory_server
		else
       		pathadd RTT_COMPONENT_PATH $ROBOTOLOGY_ROOT/build/install/lib/orocos/gnulinux/ros_orocos_joint_trajectory_server
		fi
       fi
fi

#gazebo setup
if [ -f /usr/share/gazebo/setup.sh ]; then
    source /usr/share/gazebo/setup.sh
fi

if [ -f ${ROBOTOLOGY_ROOT}/external/ros2_ws/install/local_setup.sh ]; then
    source ${ROBOTOLOGY_ROOT}/external/ros2_ws/install/local_setup.*
fi

export PATH=$ROBOTOLOGY_ROOT/build/install/bin:$PATH
export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib:$LD_LIBRARY_PATH
export LTDL_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib/roboptim-core:$LTDL_LIBRARY_PATH
pathadd CMAKE_PREFIX_PATH $ROBOTOLOGY_ROOT/build/install
export ROS_PACKAGE_PATH=$ROBOTOLOGY_ROOT/build/install/share:$ROS_PACKAGE_PATH
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/stacks
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/lib
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/IITComanRosPkg
pathadd CPATH $ROBOTOLOGY_ROOT/build/install/include
pathadd CPATH /opt/ros/${ROS_DISTRO}/include
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/site-packages
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/dist-packages
pathadd PYTHONPATH $ROBOTOLOGY_ROOT/external/OpenSoT/python/interfaces/yarp
pathadd PKG_CONFIG_PATH $ROBOTOLOGY_ROOT/build/install/lib/pkgconfig
pathadd GAZEBO_PLUGIN_PATH /opt/ros/${ROS_DISTRO}/lib
pathadd GAZEBO_PLUGIN_PATH $ROBOTOLOGY_ROOT/build/install/lib
pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/IITComanRosPkg/coman_gazebo/database
pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/icub_gazebo
if [ -d $ROBOTOLOGY_ROOT/robots/walkman_final_demo_field ]; then
       pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/walkman_final_demo_field
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/walkman_final_demo_field
fi
if [ -d $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg
	 pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/iit-bigman-ros-pkg/bigman_gazebo/database
fi

if [ -d $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg
	pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/openth/ynl-hydra-ros-pkg/hydra_gazebo/database
fi

if [ -d $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg
	pathadd GAZEBO_MODEL_PATH $ROBOTOLOGY_ROOT/robots/iit-cogimon-ros-pkg/cogimon_gazebo/database
fi

if [ -d $ROBOTOLOGY_ROOT/external/yarp_ros_joint_state_publisher ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/yarp_ros_joint_state_publisher
fi

if [ -d $ROBOTOLOGY_ROOT/external/robot_state_publisher_ext ]; then
	pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/robot_state_publisher_ext
fi

if [ -d ${ROBOTOLOGY_ROOT}/external/ros_orocos_joints_gui ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/ros_orocos_joints_gui
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/ros_orocos_joints_gui/python
fi

if [ -d ${ROBOTOLOGY_ROOT}/robots/centauro-simulator ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/centauro-simulator
fi

if [ -d ${ROBOTOLOGY_ROOT}/robots/gazebo_ros_demos ]; then
       pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/gazebo_ros_demos
fi



# vigir stuffs
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_basics ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_basics
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_core ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_core
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_msgs ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_footstep_planning_msgs
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_generic_params ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_generic_params
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_pluginlib ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_pluginlib
fi
if [ -d $ROBOTOLOGY_ROOT/vigir/vigir_terrain_classifier ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/vigir/vigir_terrain_classifier
fi
if [ -d $ROBOTOLOGY_ROOT/external/gazebo-pkgs ]; then
        pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/external/gazebo-pkgs/gazebo_grasp_plugin
fi


export COMAN_ROOT=${ROBOTOLOGY_ROOT}/build/install

# TODO add a switch here to select correct robot
export YARP_ROBOT_NAME=bigman
export YARP_COLORED_OUTPUT=1
export YARP_DATA_DIRS=${ROBOTOLOGY_ROOT}/build/install/share/yarp/


unset YARP_CLOCK
unalias gazebo > /dev/null 2>&1
unalias gzserver > /dev/null 2>&1
if [ "${ROBOTOLOGY_PROFILE:=DEFAULT}" == "SIMULATION" ]; then
    export YARP_CLOCK=/clock
  
    alias gazeboyarp='gazebo --verbose -s libgazebo_yarp_clock.so'
    alias gazeboros='export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROBOTOLOGY_ROOT/build/install/lib/drcsim_gazebo_ros_plugins/plugins; gazebo --verbose -s libgazebo_ros_api_plugin.so'
    alias gazeborosyarp='export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROBOTOLOGY_ROOT/build/install/lib/drcsim_gazebo_ros_plugins/plugins; gazebo --verbose -s libgazebo_ros_api_plugin.so -s libgazebo_yarp_clock.so'

fi

export YARP_WORKSPACE=${ROBOTOLOGY_ROOT}/robots

if [ -f ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion ]; then
    source ${ROBOTOLOGY_ROOT}/external/YARP/scripts/yarp_completion
fi

# Some aliases for superbuild/scripts
alias superbuild=". ${ROBOTOLOGY_ROOT}/scripts/superbuild.sh"
source ${ROBOTOLOGY_ROOT}/scripts/superbuild.profile

# add robotology folder for robot models
if [ -d $ROBOTOLOGY_ROOT/build/install/share/robots ]; then
	export ROBOTOLOGY_ROBOTS=$ROBOTOLOGY_ROOT/build/install/share/robots
else
	unset ROBOTOLOGY_ROBOTS
fi
 
