# osqp
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(  osqp TYPE GIT
                STYLE GITHUB
                REPOSITORY oxfordcontrol/osqp
                TAG master
                COMPONENT external
                CMAKE_CACHE_ARGS -DDLONG:BOOL=OFF
            )
