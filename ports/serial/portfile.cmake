#set(SOURCE_PATH "${CURRENT_PORT_DIR}/src")

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/wjwwood/serial.git
    REF 69e0372cf0d3796e84ce9a09aff1d74496f68720
    HEAD_REF master
    PATCHES
        patches/remove-catkin.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DSERIAL_BUILD_EXAMPLES=OFF
        -DSERIAL_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME mylib CONFIG_PATH "lib/cmake/serial")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
