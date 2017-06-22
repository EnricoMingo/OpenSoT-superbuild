# ManipulationExample
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  ManipulationExample
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/ManipulationExample.git
                TAG master
                COMPONENT external
		DEPENDS XCM

             )
