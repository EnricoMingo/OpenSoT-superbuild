# RobotInterfaceROS
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  RobotInterfaceROS
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/RobotInterfaceROS.git
                TAG master
                COMPONENT external
		DEPENDS XBotInterface
             )
