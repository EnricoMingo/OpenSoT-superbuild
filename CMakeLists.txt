cmake_minimum_required(VERSION 2.8.12)

if(POLICY CMP0064 AND COMMAND cmake_policy)
    cmake_policy(SET CMP0064 OLD)
endif(POLICY CMP0064 AND COMMAND cmake_policy)

project(robotology NONE)

macro(find_or_build_package_with_tag project_name enabled)
       set(SUPERBUILD_${project_name} ${enabled} CACHE BOOL "Flag to compile ${project_name}")
       IF(SUPERBUILD_${project_name})
	       find_or_build_package(${project_name})
       ENDIF(SUPERBUILD_${project_name})
endmacro(find_or_build_package_with_tag) 

## we have to enable C because it is currently used
## by CMake to describe packages (in Config*.cmake files)
enable_language(C)

# Set profile directory as first directory in the path, in order to
# be able to build subprojects with different flags depending on
# the profile
set(ROBOTOLOGY_PROFILE "$ENV{ROBOTOLOGY_PROFILE}")
if(NOT ROBOTOLOGY_PROFILE)
  set(ROBOTOLOGY_PROFILE "DEFAULT")
endif()
string(TOLOWER "${ROBOTOLOGY_PROFILE}" profile_dir)
set(profile_dir ${CMAKE_SOURCE_DIR}/profiles/${profile_dir}/cmake)
if(EXISTS ${profile_dir})
  list(APPEND CMAKE_MODULE_PATH ${profile_dir})
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(ROBOTOLOGY_MAJOR_VERSION 2)
set(ROBOTOLOGY_MINOR_VERSION 0)
set(ROBOTOLOGY_PATCH_VERSION 0)
set(ROBOTOLOGY_VERSION ${ROBOTOLOGY_MAJOR_VERSION}.${ROBOTOLOGY_MINOR_VERSION}.${ROBOTOLOGY_PATCH_VERSION})

set(YCM_EP_MAINTAINER_MODE FALSE)

include(CTest)
include(FeatureSummary)

set(YCM_GIT_GITLAB_ROBOTOLOGY_BASE_ADDRESS "https://gitlab.robotology.eu/" CACHE STRING "Address to use for Robotology Gitlab git repositories" FORCE)

if(UBUNTU_XENIAL)
    set(YCM_USE_CMAKE_PROPOSED FALSE CACHE BOOL "Use files including unmerged cmake patches")

    set(PYTHON_VERSION "2.7" CACHE STRING "Python Version" FORCE)
    set(PYTHON_EXECUTABLE "/usr/bin/python2.7" CACHE STRING "Python Executable Path" FORCE)
    set(PYTHON_INCLUDE_DIR "/usr/include/python2.7" CACHE STRING "Python Include Folder Path" FORCE)
    set(PYTHON_LIBRARY "/usr/lib/x86_64-linux-gnu/libpython2.7.so" CACHE STRING "Python Library Folder Path" FORCE)
else(UBUNTU_XENIAL)
    set(YCM_USE_CMAKE_PROPOSED TRUE CACHE BOOL "Use files including unmerged cmake patches")
endif(UBUNTU_XENIAL)

include(ProjectsTags OPTIONAL)

# Bootstrap YCM
include(YCMBootstrap)

include(FindOrBuildPackage)
include(YCMEPHelper)

## Insert here the OpenSoT related packages to compile ##
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/projects)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/projects/advr-core)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/projects/INAIL)
##



set_package_properties(Git PROPERTIES TYPE RUNTIME)
set_package_properties(Subversion PROPERTIES TYPE RUNTIME)
set_package_properties(PkgConfig PROPERTIES TYPE RUNTIME)
set_package_properties(Doxygen PROPERTIES TYPE RUNTIME)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)


#YCM_WRITE_DOT_FILE(ADVR-YCM.dot)
