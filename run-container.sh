EASYBUILD_SOURCE="/opt/apps/easybuild/sources"
EB_REPOS_PATH="${PWD}/ebfiles_repo"
CONTAINER_PATH="/opt/apptainer/containers"
BUILD_OS="jammy"
EASYBUILD_PATH="/opt/apps/easybuild-${BUILD_OS}"
SCRATCH_PATH="/scratch/eb/${BUILD_OS}"

mkdir -p ${EASYBUILD_PATH} ${SCRATCH_PATH}

singularity exec \
	--bind ${SCRATCH_PATH}:/scratch:rw,${EASYBUILD_PATH}:/opt/apps/easybuild,${EB_REPOS_PATH}:/ebfiles_repo,${EASYBUILD_SOURCE}:/opt/apps/easybuild/sources \
	${CONTAINER_PATH}/builder-${BUILD_OS}.simg \
        eb -f R-4.0.5-foss-2022a.eb R-4.1.2-foss-2022a.eb R-4.2.1-foss-2022a.eb	
