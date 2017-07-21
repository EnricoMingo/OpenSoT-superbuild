#cmake_minimum_required(VERSION 3.0.0)
cmake_minimum_required(VERSION 2.8.12)

set(YCM_GIT_GITLAB_ADVRCLOUD_BASE_ADDRESS "ssh://git@gitlab.advrcloud.iit.it/" CACHE STRING "Address to use for ADVR cloud Gitlab git repositories" FORCE)

# ---------------------
# Compile XBotInterface
# ---------------------
find_or_build_package_with_tag(XBotInterface ON)

# ---------------------
# Compile srdfdom_advr
# ---------------------
find_or_build_package_with_tag(srdfdom_advr ON)

# ---------------------
# Compile XBotCoreModel
# ---------------------
find_or_build_package_with_tag(XBotCoreModel ON)

# ------------------
# Compile sharedlibpp
# ------------------
find_or_build_package_with_tag(sharedlibpp ON)

# -------------------------
# Compile ModelInterfaceRBDL
# -------------------------
find_or_build_package_with_tag(ModelInterfaceRBDL ON)

# -------------------
# Compile ADVR_shared
# -------------------
find_or_build_package_with_tag(ADVR_shared OFF)

# --------------------------------------
# Compile trajectory_utils
# --------------------------------------
find_or_build_package_with_tag(trajectory_utils ON)
