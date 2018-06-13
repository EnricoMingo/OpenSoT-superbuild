# XBotInterface
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotLogger QUIET)
find_or_build_package(sharedlibpp QUIET)
find_or_build_package(bprinter QUIET)

ycm_ep_helper(  XBotInterface
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/XBotInterface.git
                TAG devel
                COMPONENT external
                DEPENDS XBotLogger
			sharedlibpp
			bprinter
             )
