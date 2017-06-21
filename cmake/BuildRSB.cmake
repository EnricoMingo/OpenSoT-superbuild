# RSB
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RSC QUIET)
find_or_build_package(RSB_Protocol QUIET)

ycm_ep_helper(  RSB
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.org/git/rsb.git.cpp
                TAG 0.14
		DEPENDS RSC RSB_Protocol
                COMPONENT RSB
            )
