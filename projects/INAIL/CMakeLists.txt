cmake_minimum_required(VERSION 2.8.12)

# ---------------------
# Compile flying_arm model
# ---------------------
find_or_build_package_with_tag(iit-flying_arm-ros-pkg OFF)

# ---------------------
# Compile hyq-description
# ---------------------
find_or_build_package_with_tag(hyq-description OFF)



