# RobotInterfaceRBDL
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(rbdl QUIET)
find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  ModelInterfaceRBDL
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/ModelInterfaceRBDL.git
                TAG devel
                COMPONENT external
		DEPENDS rbdl
			XBotInterface
             )
