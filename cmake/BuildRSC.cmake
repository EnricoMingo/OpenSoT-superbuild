# RSC
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  RSC
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rsc.git
                TAG 0.15
                COMPONENT RSB
            )
