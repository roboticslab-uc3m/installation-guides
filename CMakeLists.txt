cmake_minimum_required(VERSION 2.6)

project(ROBOTICSLAB_INSTALLATION_GUIDES)

find_package(YARP REQUIRED)
list(APPEND CMAKE_MODULE_PATH ${YARP_MODULE_PATH})
include(YarpInstallationHelpers)
yarp_configure_external_installation(roboticslab-installation-guides)

file(GLOB md ${CMAKE_CURRENT_SOURCE_DIR}/*.md)
yarp_install(FILES ${md} DESTINATION ${ROBOTICSLAB-INSTALLATION-GUIDES_CONTEXTS_INSTALL_DIR})

include(GNUInstallDirs)

if(WIN32 AND NOT CYGWIN)
    set(_cmake_destination CMake)
else()
    set(_cmake_destination ${CMAKE_INSTALL_LIBDIR}/cmake/ROBOTICSLAB_INSTALLATION_GUIDES)
endif()

export(PACKAGE ROBOTICSLAB_INSTALLATION_GUIDES)

file(WRITE ${CMAKE_BINARY_DIR}/ROBOTICSLAB_INSTALLATION_GUIDESConfig.cmake "# Dummy CMake configuration export file.")
install(FILES ${CMAKE_BINARY_DIR}/ROBOTICSLAB_INSTALLATION_GUIDESConfig.cmake DESTINATION ${_cmake_destination})

include(AddUninstallTarget)
