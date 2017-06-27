# srdfdom_advr
include(YCMEPHelper)

ycm_ep_helper(  srdfdom_advr
                TYPE GIT
                STYLE GITHUB
                REPOSITORY ADVRHumanoids/srdfdom.git
                TAG master
                COMPONENT external
		#CMAKE_CACHE_ARGS -Dgtest_build_tests:BOOL=ON
		)
