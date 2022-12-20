

# HDF_BASE - file protocol
# HDF_PATH - Path to git repository, or file in question
# HDF_NAME - Path to the XSA file once downloaded (must be inside WORKDIR) (See anon python)
#HDF_BASE ??= "git://"
#HDF_PATH ??= "github.com/Xilinx/hdf-examples.git"
#HDF_NAME ??= ""

BRANCH = "${HDF_BRANCH}"
SRCREV = "${HDF_SRCREV}"

#HDF_BRANCHARG ??= "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"

# reminder: # Don't set S = "${WORKDIR}/git" as we need this to work for other protocols
# reminder: # HDF_NAME will be adjusted to include /git if needed
# reminder: S = "${WORKDIR}"
