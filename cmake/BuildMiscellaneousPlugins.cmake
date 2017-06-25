# MiscellaneousPlugins
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)
find_or_build_package(OpenSoT-lite QUIET)

ycm_ep_helper(  MiscellaneousPlugins
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/MiscellaneousPlugins.git
                TAG master
                COMPONENT external
		DEPENDS XCM
			OpenSoT-lite
             )
