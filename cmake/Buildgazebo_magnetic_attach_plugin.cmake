# gazebo_magnetic_attach_plugin
include(YCMEPHelper)

find_package(roscpp QUIET)
find_package(gazebo QUIET)

ycm_ep_helper(  gazebo_magnetic_attach_plugin
                TYPE GIT
                STYLE GITLAB
                REPOSITORY https://gitlab.com/xinsongyan/gazebo_magnetic_attach_plugin.git
                TAG master
                COMPONENT external
                DEPENDS roscpp
                        gazebo
            )
