#!/bin/bash

(return 0 2>/dev/null) && sourced=1 || sourced=0

if [ ${sourced} -eq 0  ];then
    echo "The script can only be used via source"
    exit 1
fi


BSP_DIR=${PWD}
SCRIPT_DIR=$(dirname $(realpath ${BASH_SOURCE}))

BOARD_CONFIG_DIR="${BSP_DIR}/enabled_boards"

BOARD_SETUP_PATH="${BOARD_CONFIG_DIR}/${BOARD}/setup.sh"

if [ ! -f "${BOARD_SETUP_PATH}" ]; then
    AVAILABLE_BOARDS=$(ls ${BOARD_CONFIG_DIR})
    if [ -z ${AVAILABLE_BOARDS} ]; then
        echo "No enabled board configurations found!"
        return 1
    fi

    for board in ${AVAILABLE_BOARDS}; do
        if [ -f "${BOARD_CONFIG_DIR}/${board}/setup.sh" ]; then
            BOARD=${board}
            BOARD_SETUP_PATH="${BOARD_CONFIG_DIR}/${BOARD}/setup.sh"
            break
        fi
    done

    echo "BOARD env variable is not set falling back to default: ${BOARD}!"
fi

BUILD_DIR=$(realpath "${BSP_DIR}/build_${BOARD}")

if [ -d "${BUILD_DIR}" ];then
    FULL_SETUP=0
else
    FULL_SETUP=1
fi

source ${BOARD_SETUP_PATH}

if [ ! -f  "${LOCAL_CONF_FILE}.bak.avt" ]; then
    LOCAL_CONF_FILE="${BUILD_DIR}/conf/local.conf"
    BBLAYERS_FILE="${BUILD_DIR}/conf/bblayers.conf"

    if [ -z $(grep "meta-alvium-avt" ${BBLAYERS_FILE}) ]; then
        echo "BBLAYERS += \"\${BSPDIR}/sources/meta-alvium-avt\"" >> ${BBLAYERS_FILE}
    fi

    cp  "${LOCAL_CONF_FILE}" "${LOCAL_CONF_FILE}.bak.avt"

    BOARD_CONF_FILE="${BOARD_CONFIG_DIR}/${BOARD}/board.conf"

    if [ -f "${BOARD_CONF_FILE}" ]; then
        cat "${BOARD_CONF_FILE}" >> ${LOCAL_CONF_FILE}
    fi
fi