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
# Compile RobotInterfaceROS
# -------------------------
find_or_build_package_with_tag(RobotInterfaceROS ON)

# -------------------------
# Compile ModelInterfaceRBDL
# -------------------------
find_or_build_package_with_tag(ModelInterfaceRBDL ON)

# -------------------------
# Compile ModelInterfaceIDYNUTILS
# -------------------------
find_or_build_package_with_tag(ModelInterfaceIDYNUTILS OFF)

# ---------------------------
# Compile RobotInterfaceDUMMY
# ---------------------------
find_or_build_package_with_tag(RobotInterfaceDUMMY ON)

# --------------------------
# Compile RobotInterfaceYARP
# --------------------------
find_or_build_package_with_tag(RobotInterfaceYARP OFF)

# ----------------------------
# Compile RobotInterfaceXBotRT
# ----------------------------
find_or_build_package_with_tag(RobotInterfaceXBotRT ON)

# ----------------------------
# Compile XCM
# ----------------------------
find_or_build_package_with_tag(XCM ON)

# -------------------
# Compile ADVR_shared
# -------------------
find_or_build_package_with_tag(ADVR_shared OFF)

# -------------------
# Compile advr_humanoids_common_utils
# -------------------
find_or_build_package_with_tag(advr_humanoids_common_utils OFF)

# ----------------
# Compile XBotCore
# ----------------
set(SUPERBUILD_XBotCore OFF CACHE BOOL "Flag to compile XBotCore and his dependencies: XBotCoreModel, soem_advr, walkman-master-ecat, ec_master_test")
if(SUPERBUILD_XBotCore)
find_or_build_package(XBotCore)
	find_or_build_package(XBotCoreModel)
	find_or_build_package(soem_advr)
	find_or_build_package(walkman-master-ecat)
	find_or_build_package(ec_master_test)
endif(SUPERBUILD_XBotCore)

# ------------------------
# Compile GazeboXBotPlugin
# ------------------------
find_or_build_package_with_tag(GazeboXBotPlugin ON)

# ----------------
# Compile EtherCAT_tools
# ----------------
find_or_build_package_with_tag(EtherCAT_tools OFF)

# ----------------
# Compile XBotYARP
# ----------------
find_or_build_package_with_tag(XBotYARP OFF)

# ----------------
# Compile XBotGUI
# ----------------
find_or_build_package_with_tag(XBotGUI OFF)

# ----------------
# Compile OpenSoT-lite
# ----------------
find_or_build_package_with_tag(OpenSoT-lite OFF)

# ----------------
# Compile MiscellaneousPlugins
# ----------------
find_or_build_package_with_tag(MiscellaneousPlugins ON)

# --------------------------------------
# Compile trajectory_utils
# --------------------------------------
find_or_build_package_with_tag(trajectory_utils OFF)

# --------------------------------------
# Compile ADVR_ROS
# --------------------------------------
find_or_build_package_with_tag(ADVR_ROS ON)

# --------------------------------------
# Compile ManipulationPlugin
# --------------------------------------
find_or_build_package_with_tag(ManipulationPlugin ON)

