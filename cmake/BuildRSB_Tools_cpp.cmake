# RSB-Tools-cpp
include(YCMEPHelper)
include(FindOrBuildPackage)

FIND_PACKAGE(RSB QUIET)

ycm_ep_helper(  RSB_Tools_cpp
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rsb.git.tools-cpp
                TAG 0.15
                COMPONENT RSB
                DEPENDS RSB
            )
