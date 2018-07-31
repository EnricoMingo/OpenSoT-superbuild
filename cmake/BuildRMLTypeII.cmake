# RMLTypeII
include(YCMEPHelper)
include(FindOrBuildPackage)

ycm_ep_helper(RMLTypeII
              TYPE GIT
              STYLE GITHUB
              REPOSITORY ADVRHumanoids/RMLTypeII.git
              TAG master
              COMPONENT external
	      DEPENDS
             )
