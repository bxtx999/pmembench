
# Check that pmem path is set
if [ -z "$PMEM_PATH" ];
then
    echo "Please set PMEM_PATH to point to a directory on PMem."
    echo "Example: export PMEM_PATH=/mnt/pmem"
    exit -1
fi

if [ ! -d ${PMEM_PATH} ];
then
    echo "The configured PMEM_PATH '${PMEM_PATH}' is not a directory."
    echo "Example: export PMEM_PATH=/mnt/pmem"
    exit -1
fi
