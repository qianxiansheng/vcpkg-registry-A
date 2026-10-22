cmake_minimum_required(VERSION 3.20)
project(mylib CXX)

# 生成静态库
add_library(mylib STATIC mylib.cpp)

# PUBLIC: 库本身编译需要头文件：使用者自动继承头文件路径
target_include_directories(mylib PUBLIC 
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
    "$<INSTALL_INTERFACE:include>"
)

# =============== 安装规则：导出目标，带命名空间 ===============
install(TARGETS mylib
    EXPORT mylib-targets
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)

# 安装头文件
install(FILES mylib.h DESTINATION include)

# =============== 生成 mylibConfig.cmake 和 mylib-targets.cmake ===============
include(CMakePackageConfigHelpers)

# 版本文件（可选，后面可以用来做版本校验）
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake"
    VERSION 1.0.0
    COMPATIBILITY SameMajorVersion
)

# 用模板生成 Config.cmake
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/mylibConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake"
    INSTALL_DESTINATION share/mylib
)

# 把生成好的 config / version 文件安装到 share/mylib
install(
    FILES
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake"
    DESTINATION share/mylib
)

# 导出 target 脚本，加上命名空间 mylib::
install(EXPORT mylib-targets
    FILE mylib-targets.cmake
    NAMESPACE mylib::
    DESTINATION share/mylib
)
