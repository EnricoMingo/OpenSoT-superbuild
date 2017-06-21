# RSB
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RSC QUIET)
find_or_build_package(RSB_Protocol QUIET)

ycm_ep_helper(  RSB
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rsb.git
                TAG 0.15
		DEPENDS RSC RSB_Protocol
                COMPONENT RSB
            )
