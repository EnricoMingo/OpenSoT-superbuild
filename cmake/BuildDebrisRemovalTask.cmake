include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(  DebrisRemovalTask
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/DebrisRemovalTask.git
                TAG master
                COMPONENT external
                DEPENDS XCM
            )
