#!/bin/bash

# set
PARAM_SS_PORT=""
if [ "${SS_PORT}" ]
then
    PARAM_SS_PORT=${SS_PORT}
else
    PARAM_SS_PORT=1949
fi
PARAM_SS_PASSWORD=""
if [ "${SS_PASSWORD}" ]
then
    PARAM_SS_PASSWORD="${SS_PASSWORD}"
else
    PARAM_SS_PASSWORD="`head -n 4096 /dev/urandom | tr -cd '[:alnum:]!@#$%^&*_' | head -c 16`"
fi
PARAM_SS_METHOD=""
if [ "${SS_METHOD}" ]
then
    PARAM_SS_METHOD="${SS_METHOD}"
else
    PARAM_SS_METHOD="aes-256-cfb"
fi

# output
echo "----- ----- ----- ----- -----"
echo "----- ----- ----- ----- -----"
echo "----- ----- ----- ----- -----"
if [ "${SS_PORT}" ]
then
    echo "ss port: ${PARAM_SS_PORT} (created by env)"
else
    echo "ss port: ${PARAM_SS_PORT}"
fi
if [ "${SS_PASSWORD}" ]
then
    echo "ss password: ${PARAM_SS_PASSWORD} (created by env)"
else
    echo "ss password: ${PARAM_SS_PASSWORD}"
fi
if [ "${SS_METHOD}" ]
then
    echo "ss method: ${PARAM_SS_METHOD} (created by env)"
else
    echo "ss method: ${PARAM_SS_METHOD}"
fi
echo "----- ----- ----- ----- -----"
echo "----- ----- ----- ----- -----"
echo "----- ----- ----- ----- -----"

# run
/usr/bin/ssserver -p ${PARAM_SS_PORT} -k ${PARAM_SS_PASSWORD} \
-m ${PARAM_SS_METHOD} -qq --fast-open --user nobody
