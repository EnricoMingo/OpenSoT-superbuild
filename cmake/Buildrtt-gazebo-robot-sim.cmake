# rtt-gazebo-robot-sim
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)
find_package(RST_RT QUIET)

ycm_ep_helper(  rtt-gazebo-robot-sim
                TYPE GIT
                STYLE GITHUB
                REPOSITORY cogimon/rtt-gazebo-robot-sim.git
                TAG master
                COMPONENT external
                DEPENDS RST_RT
            )
