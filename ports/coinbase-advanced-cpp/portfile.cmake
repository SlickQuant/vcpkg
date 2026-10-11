vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SlickQuant/coinbase-advanced-cpp
    REF "v${VERSION}"
    SHA512 7d0a95ded7502809fd9545ce72193e0e4e8eb79fcdb708e256111e69a35431b5ca5fad9715bebd2f4a264a3948716b52ee3afa60c536fd399de5127de2b6794e
    HEAD_REF main
    PATCHES
        disable-config-fetchcontent-fallback.patch # also https://github.com/SlickQuant/coinbase-advanced-cpp/pull/1
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_COINBASE_ADVANCED_TESTS=OFF
        -DBUILD_COINBASE_ADVANCED_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME coinbase-advanced-cpp CONFIG_PATH lib/cmake/coinbase-advanced-cpp)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
