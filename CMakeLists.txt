cmake_minimum_required(VERSION 3.12)

# Define a project.
project(ROBOTICSLAB_INSTALLATION_GUIDES LANGUAGES NONE)

# Pick up our cmake modules.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# Find dependencies.
find_package(YCM 0.10 REQUIRED)

# Add custom rule to generate and install the MkDocs site.
include(AddMkDocsTarget)

# Store the package in the user registry.
set(CMAKE_EXPORT_PACKAGE_REGISTRY ON)

# Create and install config files.
include(InstallBasicPackageFiles)

install_basic_package_files(ROBOTICSLAB_INSTALLATION_GUIDES
                            VERSION 0.1.0
                            COMPATIBILITY AnyNewerVersion
                            NO_EXPORT)

# Add uninstall rule.
include(AddUninstallTarget)
