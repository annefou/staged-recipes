#!/bin/bash
set -e

export NETCDF_DIR=$(nc-config --prefix)
export CIME_MODEL=cesm
export CESM_DATA_ROOT=/tmp

mkdir -p /tmp/inputdata

create_newcase --case /tmp/cases/F2000climo  --compset F2000climo --res f19_g17 --machine espresso --run-unsupported

cd /tmp/cases/F2000climo
./case.setup
./case.build

cd -

rm -rf /tmp/cases/F2000climo
