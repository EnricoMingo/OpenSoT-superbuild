#!/bin/bash

ROBOTOLOGY_ROOT=$(dirname $(readlink --canonicalize --no-newline $BASH_SOURCE))

export ROBOTOLOGY_ROOT
export XBOT_ROOT=$ROBOTOLOGY_ROOT

pathadd() {
    if [ -z ${!1} ]; then
        export $1=$2
    elif [ -d "$2" ] && [[ ! ${!1} =~ (^|:)$2(:|$) ]]; then
        export $1+=:$2
    fi
}

export PATH=$ROBOTOLOGY_ROOT/build/install/bin:$PATH
export LD_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib:$LD_LIBRARY_PATH
export LTDL_LIBRARY_PATH=$ROBOTOLOGY_ROOT/build/install/lib/roboptim-core:$LTDL_LIBRARY_PATH
pathadd CMAKE_PREFIX_PATH $ROBOTOLOGY_ROOT/build/install

pathadd CPATH $ROBOTOLOGY_ROOT/build/install/include
pathadd CPATH /opt/ros/${ROS_DISTRO}/include

export ROS_PACKAGE_PATH=$ROBOTOLOGY_ROOT/build/install/share:$ROS_PACKAGE_PATH
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/stacks
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/build/install/lib

#COUPLE OF TEST ROBOTS
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/IITComanRosPkg
pathadd ROS_PACKAGE_PATH $ROBOTOLOGY_ROOT/robots/abb-yumi-ros-pkg

pathadd PYTHONPATH $ROBOTOLOGY_ROOT/build/install/lib/python2.7/site-packages
pathadd PKG_CONFIG_PATH $ROBOTOLOGY_ROOT/build/install/lib/pkgconfig


# Some aliases for superbuild/scripts
alias superbuild=". ${ROBOTOLOGY_ROOT}/scripts/superbuild.sh"
source ${ROBOTOLOGY_ROOT}/scripts/superbuild.profile
