#!/bin/bash

ROBOTOLOGY_ROOT=$(readlink --canonicalize --no-newline $(dirname $(readlink --canonicalize --no-newline $0))/..)

if [ -f $ROBOTOLOGY_ROOT/build/active_profile ]; then
    . $ROBOTOLOGY_ROOT/build/active_profile
fi

if [ -f ${ROBOTOLOGY_ROOT}/build/got_dependencies ]; then
    echo "ROBOTOLOGY dependencies already installed. Skipping..."
    echo "If you really want to repeat an installation, you can"
    echo "remove $ROBOTOLOGY_ROOT/build/got_dependencies"
else
    # we are on Ubutntu
    if [ "`lsb_release -is`" = 'Ubuntu' ]; then
        
        if [ "`lsb_release -cs`" = 'xenial' ]; then
          sudo apt dist-upgrade -y --allow-unauthenticated --fix-missing
        else
          sudo apt-get dist-upgrade -y --force-yes --fix-missing
        fi
        
        # 14.04
        if [ "`lsb_release -cs`" = 'trusty' ]; then
            sudo apt-get install -y --force-yes --fix-missing build-essential cmake cmake-curses-gui  \
              git subversion doxygen graphviz  \
              libeigen3-dev coinor-libipopt-dev libyaml-cpp-dev libxml2-dev  \
              python3-sip-dev python-numpy python-scipy python-matplotlib python-pandas  \
              libarmadillo-dev libblas-dev liblapack-dev  libflann-dev libmumps-seq-dev libgfortran-4.8-dev \
              libpng++-dev python-bs4 libsctp-dev mercurial libhighgui2.4 \
              libopensplice64 cppcheck \
              python3-empy python3-setuptools python3-nose python3-pip python3-vcstool \
	       protobuf-compiler   \
              ros-indigo-kdl-conversions ros-indigo-eigen-stl-containers \
              ros-indigo-geometry ros-indigo-graph-msgs ros-indigo-rviz-visual-tools
            string="`uname -r`"
            
        elif [ "`lsb_release -cs`" = 'xenial' ]; then
            sudo apt install -y --allow-unauthenticated --fix-missing build-essential cmake cmake-curses-gui  \
              git subversion doxygen graphviz  \
              libeigen3-dev coinor-libipopt-dev libyaml-cpp-dev libxml2-dev  \
              python3-sip-dev python-numpy python-scipy python-matplotlib python-pandas  \
              libarmadillo-dev libblas-dev liblapack-dev  libflann-dev libmumps-seq-dev libgfortran-4.8-dev \
              libpng++-dev python-bs4 libsctp-dev mercurial libhighgui2.4 \
              libopensplice64 cppcheck \
              python3-empy python3-setuptools python3-nose python3-pip python3-vcstool \
	       protobuf-compiler \
              ros-kinetic-kdl-conversions ros-kinetic-eigen-stl-containers \
              ros-kinetic-geometry ros-kinetic-graph-msgs ros-kinetic-rviz-visual-tools 

            mkdir -p $ROBOTOLOGY_ROOT/build
            cd $ROBOTOLOGY_ROOT/build
            cmake ..
            make fcl
        fi
    fi

    # needed by XBOTCore logger
    sudo apt-get install libmatio-dev
    
    # needed by SoT demos
    sudo apt-get install -y --force-yes --fix-missing python-pip python-pygraphviz
    sudo pip install svg.path 

    # TODO this is a [quickfix]
    echo "Adding robotology-setup.bash to your .bashrc"

    echo ">>> Press ENTER if you want to skip writing to .bashrc. "
    echo "    You should not skip it unless you know what you are doing."
    if read -t 10 -p '    I will wait for 10 seconds <<< ' ; then
        echo "... skipping"
    else
        echo ". $ROBOTOLOGY_ROOT/OpenSoT-setup.bash" >> ~/.bashrc
    fi

    . $ROBOTOLOGY_ROOT/OpenSoT-setup.bash

    # ROS indigo
    #if [ -d /opt/ros/indigo ]; then
    #    ROSVER=indigo
        #call the script to install opencv nonfree lib from sources
    #    sh $ROBOTOLOGY_ROOT/scripts/admin/get_libopencv_nonfree.sh	
        # call the script to insall PCL from sources commented
        # sh $ROBOTOLOGY_ROOT/scripts/admin/get_pcl.sh

    #	sudo apt-get install libpcl*
    #fi

    
    if [ -d $ROBOTOLOGY_ROOT/build/ ]; then
        echo "true" > $ROBOTOLOGY_ROOT/build/got_dependencies
    else
        echo "You can now run bootstrap.sh to fetch all packages"
    fi

    sudo ldconfig

    sudo pip install -U setuptools
    sudo pip install BeautifulSoup4

fi
