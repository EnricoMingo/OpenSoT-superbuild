# rst-converters
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  rst-converters
                TYPE GIT
                STYLE NONE 
                REPOSITORY https://code.cor-lab.de/git/rst.git.converters-cpp
                TAG iit-superbuild
                COMPONENT RSB
                CMAKE_CACHE_ARGS -DBUILD_TESTS:BOOL=OFF
            )
