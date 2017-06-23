# Hose_Task
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotCoreModel QUIET)
find_or_build_package(XBotInterface QUIET)

ycm_ep_helper(  Head2Hand_Calib
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/Head2Hand_Calib.git
                TAG master
                COMPONENT external
                DEPENDS XBotCoreModel
                        XBotInterface
             )
