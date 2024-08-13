include_guard(GLOBAL)

# Find MkDocs
find_program(MKDOCS_ABSPATH NAMES mkdocs)

if(MKDOCS_ABSPATH)
    include(GNUInstallDirs)

    set(_site_dir ${CMAKE_BINARY_DIR}/site)

    # Add a custom target to generate the documentation.
    add_custom_target(mkdocs ALL ${MKDOCS_ABSPATH} build --site-dir ${_site_dir}
                             WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                             COMMENT "Generating MkDocs documentation in ${_site_dir}")

    # Install the generated documentation.
    install(DIRECTORY ${_site_dir}
            DESTINATION ${CMAKE_INSTALL_DOCDIR})
endif()
