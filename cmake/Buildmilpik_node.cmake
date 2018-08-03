# milpik_node
include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(XBotInterface QUIET)
find_or_build_package(OpenSoT QUIET)
find_or_build_package(RMLTypeII QUIET)
find_or_build_package(RobotInterfaceROS QUIET)
find_or_build_package(CartesianInterface QUIET)

ycm_ep_helper(milpik_node
              TYPE GIT
              STYLE GITHUB
              REPOSITORY ADVRHumanoids/milpik_node.git
              TAG master
              COMPONENT external
	      DEPENDS CartesianInterface OpenSoT RMLTypeII XBotInterface RobotInterfaceROS
             )
