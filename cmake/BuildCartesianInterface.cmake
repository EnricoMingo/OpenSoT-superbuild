# QPPVM_RT_plugin
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)
find_or_build_package(OpenSoT QUIET)
find_or_build_package(RMLTypeII QUIET)
find_or_build_package(RobotInterfaceROS QUIET)

ycm_ep_helper(CartesianInterface
              TYPE GIT
              STYLE GITHUB
              REPOSITORY ADVRHumanoids/CartesianInterface.git
              TAG master
              COMPONENT external
	      DEPENDS OpenSoT XBotInterface RobotInterfaceROS RMLTypeII
             )
