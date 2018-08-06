# iit-flying_arm-ros-pkg
include(YCMEPHelper)
include(FindOrBuildPackage)

#find_or_build_package(moveit_compute_default_collisions REQUIRED QUIET)

ycm_ep_helper(  iit-flying_arm-ros-pkg
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/iit-flying_arm-ros-pkg.git
                TAG master
                COMPONENT robots
               # DEPENDS moveit_compute_default_collisions
                INSTALL_COMMAND ""
            )
