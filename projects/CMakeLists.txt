cmake_minimum_required(VERSION 2.8.12)

# ----------------
# DRC CORE 
# ----------------
set(SUPERBUILD_DRC_CORE OFF CACHE BOOL "Flag to compile DRC_CORE repos: YARP, iDynTree, idynutils, OpenSoT, GYM, paramHelp")
IF(SUPERBUILD_DRC_CORE)
    find_or_build_package(YARP)
    find_or_build_package(iDynTree)
    find_or_build_package(idynutils)
    find_or_build_package(OpenSoT)
    find_or_build_package(GYM)
    find_or_build_package(paramHelp)

    # Compile Gazebo comanapp
    find_or_build_package_with_tag(comanapp OFF)

ENDIF(SUPERBUILD_DRC_CORE)

# ----------------
# 
set(SUPERBUILD_COMAN_INTERFACE OFF CACHE BOOL "Flag to compile robotInterface for coman")
IF(SUPERBUILD_COMAN_INTERFACE)
    find_or_build_package(comaninterface)
    find_or_build_package(comanmod)
ENDIF(SUPERBUILD_COMAN_INTERFACE)

#------
# Model
#------
# Compile COMAN model
find_or_build_package_with_tag(IITComanRosPkg OFF)
# Compile iCub model
find_or_build_package_with_tag(icub_gazebo OFF)
# Compile Gazebo YARP plugin
find_or_build_package_with_tag(GazeboYARPPlugins OFF)

# -------------------------------------------
# Compile CAPSULE for the collision avoidance
# -------------------------------------------
set(SUPERBUILD_CAPSULE OFF CACHE BOOL "Flag to compile roboptim-core, moveit_compute_default_collisions, roboptim-capsule, roboptim-core-plugin-ipopt, robot_capsule_generator")
IF(SUPERBUILD_CAPSULE)
	find_or_build_package(roboptim-core)
	find_or_build_package(moveit_compute_default_collisions)
	find_or_build_package(roboptim-capsule)
	find_or_build_package(roboptim-core-plugin-ipopt)
	find_or_build_package(robot_capsule_generator)
ENDIF(SUPERBUILD_CAPSULE)

# --------------------------------------
# Compile yarp_ros_joint_state_publisher
# --------------------------------------
find_or_build_package_with_tag(yarp_ros_joint_state_publisher OFF)

# --------------------------------------
# Compile robot_state_publisher_ext
# --------------------------------------
find_or_build_package_with_tag(robot_state_publisher_ext OFF)

# ---------------------
# Compile simple_homing
# ---------------------
find_or_build_package_with_tag(simple_homing OFF)

# --------------------------------------
# Compile testQPsolvers - OFF by default
# --------------------------------------
find_or_build_package_with_tag(testQPsolvers OFF)

# ---------------------
# Compile ft_publisher
# ---------------------
find_or_build_package_with_tag(ft_publisher OFF)

# ---------------------
# Compile locoman_utils
# ---------------------
find_or_build_package_with_tag(locoman_utils OFF)

# --------------------------------------
# Compile drc_shared
# --------------------------------------
find_or_build_package_with_tag(drc_shared OFF)

# --------------------------------------
# Compile trajectory_generator
# --------------------------------------
find_or_build_package_with_tag(trajectory_generator OFF)

# --------------------------------------
# Compile drc_poses
# --------------------------------------
find_or_build_package_with_tag(drc_poses OFF)

# --------------------------------------
# Compile pilot_interface
# --------------------------------------
find_or_build_package_with_tag(pilot_interface OFF)

# --------------------------------------
# Compile network
# --------------------------------------
find_or_build_package_with_tag(network OFF)


# --------------------------------------
# Compile robotran predictor modules
# --------------------------------------
set(SUPERBUILD_robotran_predictor OFF CACHE BOOL "Flag to compile Robotran predictor modules")
IF(SUPERBUILD_robotran_predictor)
    find_or_build_package(robotran_predictor)
    find_or_build_package(robotran_predictor_ctrl_test)
ENDIF(SUPERBUILD_robotran_predictor)

# --------------------------------------
# Compile supervisor
# --------------------------------------
find_or_build_package_with_tag(supervisor OFF)

IF(NOT USE_ONLY_OPEN_SOURCE)
        # --------------------------------------
        # Compile iit-bigman-ros-pkg
        # --------------------------------------
        find_or_build_package_with_tag(iit-bigman-ros-pkg ON)
        
        # --------------------------------------
        # Compile walking
        # --------------------------------------
        find_or_build_package_with_tag(walking OFF)
        
        # --------------------------------------
        # Compile arms_ik
        # --------------------------------------
        find_or_build_package_with_tag(arms_ik OFF)

        # --------------------------------------
        # Compile multicontact_planning
        # --------------------------------------
        find_or_build_package_with_tag(multicontact_planning OFF)

        # --------------------------------------
        # Compile footstep_perception
        # --------------------------------------
        find_or_build_package_with_tag(footstep_perception OFF)

        # --------------------------------------
        # Compile drcsim
        # --------------------------------------
        find_or_build_package_with_tag(drcsim OFF)

        # --------------------------------------
        # Compile sensors-description
        # --------------------------------------
        find_or_build_package_with_tag(sensors-description OFF)

        # --------------------------------------
        # Compile locomanipulation
        # --------------------------------------
        set(SUPERBUILD_locomanipulation OFF CACHE BOOL "Flag to compile locomanipulation")
        IF(SUPERBUILD_locomanipulation)
            find_or_build_package(locomanipulation)
            find_or_build_package(locoman_utils)
        find_or_build_package(locoman_service_1)
        find_or_build_package(locoman_service_2)
        ENDIF(SUPERBUILD_locomanipulation)

        # --------------------------------------
        # Compile yw_module
        # --------------------------------------
        find_or_build_package_with_tag(yw_module OFF)

    	# --------------------------------------
    	# centralized_manipulation
    	# --------------------------------------
    	find_or_build_package_with_tag(centralized_manipulation OFF)
       # --------------------------------------
       # COMAN_shared
       # --------------------------------------
       find_or_build_package_with_tag(COMAN_shared OFF)

       # --------------------------------------
       # walkman-drc_COMAN_shared
       # --------------------------------------
       find_or_build_package_with_tag(walkman-drc_COMAN_shared OFF)

ENDIF(NOT USE_ONLY_OPEN_SOURCE)
