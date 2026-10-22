set(SOURCE_PATH "${CURRENT_PORT_DIR}/src")

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME mylib CONFIG_PATH "share/mylib")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/LICENSE")
