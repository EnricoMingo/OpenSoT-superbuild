cmake_minimum_required(VERSION 2.8.12)

#find_or_build_package(iDynTree)
#find_or_build_package(idynutils)

#------
# OpenSoT
#------
find_or_build_package(OpenSoT)

 
#------
# Models
#------
find_or_build_package_with_tag(IITComanRosPkg OFF)

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


