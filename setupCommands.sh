#!/bin/bash

BIN_DIR=~/bin
MKDIR_CMD=/bin/mkdir
CURL_CMD=/usr/bin/curl

${MKDIR_CMD} -p ${BIN_DIR}

# git-ignore
${CURL_CMD} -sL https://raw.githubusercontent.com/yuroyoro/git-ignore/master/git-ignore > ${BIN_DIR}/git-ignore
chmod +x ${BIN_DIR}/git-ignore
