# centauro-simulator
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  centauro-simulator
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/centauro-simulator.git
                TAG xbotdays_workshop
                COMPONENT robots
                DEPENDS
                BUILD_COMMAND ""
		INSTALL_COMMAND ""
              )
