# DoorOpening
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XCM QUIET)

ycm_ep_helper(DoorOpening     
                               TYPE GIT
                               STYLE GITHUB
                               REPOSITORY ADVRHumanoids/DoorOpening.git 
                               TAG master
                               COMPONENT external
                               DEPENDS XCM
                                       
	     )
