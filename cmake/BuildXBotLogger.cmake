# QPPVM_RT_plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  XBotLogger
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/XBotLogger.git
                TAG master
                COMPONENT external
		DEPENDS 
             )
