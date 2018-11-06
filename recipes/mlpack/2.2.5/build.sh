mkdir -p build
cd build

cmake \
        -G "${CMAKE_GENERATOR}" \
	-DCMAKE_INSTALL_PREFIX="${PREFIX}" \
	-DCMAKE_PREFIX_PATH="${PREFIX}" \
	-DBUILD_CLI_EXECUTABLES=ON \
	-DBUILD_SHARED_LIBS=ON \
	-DFORCE_CXX11=OFF \
	-DBUILD_TESTS=OFF \
	../

make -j${CPU_COUNT}
make install
