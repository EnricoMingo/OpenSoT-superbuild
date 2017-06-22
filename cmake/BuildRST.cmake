# RST
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(RSC QUIET)

ycm_ep_helper(  RST
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rst.git
                TAG 0.15
                COMPONENT RSB
                DEPENDS RSC
            )
