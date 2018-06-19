cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# Define a project.
project(ROBOTICSLAB_INSTALLATION_GUIDES LANGUAGES NONE)

# Find dependencies
find_package(YCM 0.8 REQUIRED)

# https://github.com/roboticslab-uc3m/questions-and-answers/issues/65
find_package(YARP 3.0 QUIET)
if(NOT YARP_FOUND)
    find_package(YARP 2.3.70 REQUIRED)
endif()

# Set some useful variables - paths relative to the installation prefix.
yarp_configure_external_installation(roboticslab-installation-guides)

# Collect Markdown files. Globbing is evil, but we don't care. All we
# need CMake here for is to support superbuild-like repos through YCM.
file(GLOB md ${CMAKE_SOURCE_DIR}/*.md)

# Install files, create a copy in the local build tree.
yarp_install(FILES ${md}
             DESTINATION ${ROBOTICSLAB-INSTALLATION-GUIDES_CONTEXTS_INSTALL_DIR})

# Store this package in the user registry.
export(PACKAGE ${PROJECT_NAME})

# Define CMAKE_INSTALL_<dir> and CMAKE_INSTALL_FULL_<dir> variables.
include(GNUInstallDirs)

# Set installation path for CMake files.
if(WIN32 AND NOT CYGWIN)
    set(_cmake_destination CMake)
else()
    set(_cmake_destination ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
endif()

# Create dummy CMake configuration export file.
file(WRITE ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake
     "# Dummy CMake configuration export file.")

# Install CMake configuration file.
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake
        DESTINATION ${_cmake_destination})

# Add uninstall rule.
include(AddUninstallTarget)
