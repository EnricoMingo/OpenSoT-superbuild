# rtt-rsb-transport
include(YCMEPHelper)
include(FindOrBuildPackage)

find_package(OROCOS-RTT QUIET)
find_package(RSB QUIET)

ycm_ep_helper(  rtt-rsb-transport
                TYPE GIT
                STYLE GITHUB
                REPOSITORY corlab/rtt-rsb-transport.git
                TAG master
                COMPONENT RSB
                DEPENDS RSB
            )
