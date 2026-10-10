vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SlickQuant/slick-net
    REF "v${VERSION}"
    SHA512 f71bc11ea3cbd28b45395e2f9faa52a0c14f017fd6ab6440d2d0e5efa2f529f95a3c9a39778dbf59ddf01c42cea6c9818124fb0c93535a18d59731fa6caf473c
    HEAD_REF main
    PATCHES
        slick-dependencies.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_SLICK_NET_TESTS=OFF
        -DBUILD_SLICK_NET_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME slick-net CONFIG_PATH share/slick-net)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
