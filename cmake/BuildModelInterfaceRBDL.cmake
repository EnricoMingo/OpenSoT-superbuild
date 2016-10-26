# RobotInterfaceRBDL
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(rbdl QUIET)
find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  ModelInterfaceRBDL
                TYPE GIT
                STYLE GITLAB_ADVRCLOUD
                REPOSITORY advr_humanoids/modelinterfacerbdl.git
                TAG master
                COMPONENT external
		DEPENDS rbdl
			XBotInterface
             )
