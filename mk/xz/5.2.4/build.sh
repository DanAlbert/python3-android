pushd src >/dev/null

rm -rf "${PACKAGE}"
tar -xf "${PACKAGE}.tar.xz" || exit 1
pushd "${PACKAGE}" >/dev/null

#patch -p1 < "${FILESDIR}/${PACKAGE}-disable-so-versioning.patch" || exit 1
##./configure --prefix="${PREFIX}" --host="${TARGET}" --build="${HOST}" --disable-shared --disable-xz --disable-xzdec --disable-lzmadec --disable-lzmainfo --disable-lzma-links --disable-scripts || exit 1
./configure --prefix="${PREFIX}" --host="${TARGET}" --disable-shared || exit 1
make || exit 1
make install || exit 1
# Remove documentation.
rm -rf "${PREFIX}/share/doc"

popd >/dev/null
popd >/dev/null
