include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)


ycm_ep_helper(  ros_orocos_joint_trajectory_server
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/ros_orocos_joint_trajectory_server.git
                TAG master
                COMPONENT external
            )
