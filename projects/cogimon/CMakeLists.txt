cmake_minimum_required(VERSION 2.8.12)

# ---------------------
# Compile cogimon model
# ---------------------
find_or_build_package_with_tag(iit-cogimon-ros-pkg OFF)

# ---------------------
# Compile cogimon_simulation_tests
# ---------------------
find_or_build_package_with_tag(cogimon_simulation_tests OFF)

# ---------------------
# Compile orocos_tutorials
# ---------------------
find_or_build_package_with_tag(orocos_tutorials OFF)

# ---------------------
# Compile RSB related packages
# ---------------------
set(SUPERBUILD_RSB_framework OFF CACHE BOOL "Flag to compile RSB_framework")
IF(SUPERBUILD_RSB_framework)
       find_or_build_package(RSC)
       find_or_build_package(RSB_Protocol)
       find_or_build_package_with_tag(RSB OFF)
       find_or_build_package_with_tag(RSB_Tools_cpp OFF)
       find_or_build_package_with_tag(RST OFF)
       find_or_build_package(RST_RT)
       find_or_build_package_with_tag(rst-converters OFF)
       find_or_build_package_with_tag(rtt-rsb-transport OFF)
ENDIF(SUPERBUILD_RSB_framework)

# ---------------------
# Compile rtt_packages
# ---------------------
set(SUPERBUILD_rtt_packages OFF CACHE BOOL "Flag to compile rtt_packages")
IF(SUPERBUILD_rtt_packages)
       find_or_build_package(rtt_gazebo_embedded)
       find_or_build_package(rtt-gazebo-clock-plugin)
       find_or_build_package(rtt-rrct-typekit) 
       find_or_build_package(rtt-gazebo-robot-sim)     
       find_or_build_package(rtt-core-extensions)
ENDIF(SUPERBUILD_rtt_packages)

# --------------------------------------
# Compile cogimon-experimental
# --------------------------------------
find_or_build_package_with_tag(cogimon-experimental OFF)

# --------------------------------------
# Compile cogimon-scenarios
# --------------------------------------
find_or_build_package_with_tag(cogimon-scenarios OFF)

# --------------------------------------
# Compile rtt-component-template
# --------------------------------------
find_or_build_package_with_tag(rtt-component-template OFF)

# --------------------------------------
# Compile rtt-gazebo-lwr4plus-sim
# --------------------------------------
find_or_build_package_with_tag(rtt-gazebo-lwr4plus-sim OFF)

# --------------------------------------
# Compile orocos_ros_joint_state_publisher
# --------------------------------------
find_or_build_package_with_tag(orocos_ros_joint_state_publisher OFF)

# --------------------------------------
# Compile rtt_coman
# --------------------------------------
find_or_build_package_with_tag(rtt_coman OFF)

# --------------------------------------
# Compile ros_orocos_joints_gui
# --------------------------------------
find_or_build_package_with_tag(ros_orocos_joints_gui OFF)

# --------------------------------------
# Compile ros_orocos_joint_trajectory_server
# --------------------------------------
find_or_build_package_with_tag(ros_orocos_joint_trajectory_server OFF)

# --------------------------------------
# Compile compliance_ctrl
# --------------------------------------
find_or_build_package_with_tag(compliance_ctrl OFF)

# --------------------------------------
# Compile cogimon-gazebo-models
# --------------------------------------
find_or_build_package_with_tag(cogimon-gazebo-models OFF)

# --------------------------------------
# Compile gazebo-pkgs
# --------------------------------------
find_or_build_package_with_tag(gazebo-pkgs OFF)
