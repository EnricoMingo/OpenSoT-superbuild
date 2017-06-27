# QPPVM_RT_plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

# If XCM is not found, the superbuild will clone it and compile it.
# XCM is the package which manages XBot RT (real-time) Plugins.
find_or_build_package(XCM QUIET)

ycm_ep_helper(  XBotDaysWorkshop
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/XBotDaysWorkshop.git
                TAG master
                COMPONENT external
		DEPENDS XCM
	      )
