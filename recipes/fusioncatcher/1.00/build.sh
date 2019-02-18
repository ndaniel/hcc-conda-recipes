#!/bin/bash

chmod +x bin/*.py
cp bin/* ${PREFIX}/bin/
cp etc/configuration.cfg ${PREFIX}/etc/


# copy script to download database
chmod +x ${RECIPE_DIR}/download-db.sh
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin

# create folder for database download
target=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}
mkdir -p ${target}/db/
touch ${target}/db/.empty

# create the test folder
mkdir -p ${target}/db/test/
cp test/* ${target}/db/test/
chmod +x ${target}/db/test/test.sh

# set FC DB PATH variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/fusioncatcher.sh
export FC_DB_PATH=${target}/db/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/fusioncatcher.sh
unset FC_DB_PATH
EOF
