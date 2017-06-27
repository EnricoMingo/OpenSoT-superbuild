cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)


# --------------------------
# Compile centauro-simulator
# --------------------------
find_or_build_package_with_tag(centauro-simulator OFF)

# --------------------------
# Compile XBotDaysWorkshop
# --------------------------
find_or_build_package_with_tag(XBotDaysWorkshop OFF)



