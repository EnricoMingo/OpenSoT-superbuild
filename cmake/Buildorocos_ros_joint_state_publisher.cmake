# orocos_ros_joint_state_publisher
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)
find_package(rtt-core-extensions QUIET)


ycm_ep_helper(  orocos_ros_joint_state_publisher
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/orocos_ros_joint_state_publisher.git
                TAG master
                COMPONENT external
                DEPENDS rtt-core-extensions
            )
