#!/bin/bash

source global.sh

EASYBUILD_SOURCE="/opt/apps/easybuild/sources"
EB_REPOS_PATH="${PWD}/ebfiles_repo"
BUILD_OS="focal"
EASYBUILD_PATH="/opt/apps/easybuild-${BUILD_OS}"
SCRATCH_PATH="/scratch/eb/${BUILD_OS}"

mkdir -p ${EASYBUILD_PATH} ${SCRATCH_PATH}

singularity exec \
	--bind ${SCRATCH_PATH}:/scratch:rw,${EASYBUILD_PATH}:/opt/apps/easybuild,${EB_REPOS_PATH}:/ebfiles_repo,${EASYBUILD_SOURCE}:/opt/apps/easybuild/sources \
	${CONTAINER_PATH}/builder-${BUILD_OS}.simg \
	eb --quiet R-bundle-Bioconductor-3.15-foss-2022a-R-4.2.1.eb
