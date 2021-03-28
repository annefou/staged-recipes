#!/bin/bash
set -e

export NETCDF_DIR=$(nc-config --prefix)
export CIME_MODEL=cesm
export CESM_DATA_ROOT=$HOME
export CESM_WORK_ROOT=$HOME

mkdir -p $CESM_DATA_ROOT/inputdata

create_newcase --case $CESM_WORK_ROOT/cases/B1850_f19_g17  --compset B1850 --res f19_g17 --machine espresso --run-unsupported

cd $CESM_WORK_ROOT/cases/B1850_f19_g17
./case.setup
./case.build

cd -

rm -rf $CESM_WORK_ROOT/cases/B1850_f19_g17
rm -rf $CESM_WORK_ROOT/$CIME_MODEL/work/B1850_f19_g17
