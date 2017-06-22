# RSB Protocol
include(YCMEPHelper)
include(FindOrBuildPackage)

FIND_PACKAGE(RSC QUIET)

ycm_ep_helper(  RSB_Protocol
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rsb.git.protocol
                TAG 0.15
                COMPONENT RSB
                DEPENDS RSC
            )
