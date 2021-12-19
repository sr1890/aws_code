#!/bin/bash
##Script to gather AWS instance metadata,
#set -x
_URL_CMD='curl -s http://169.254.169.254/latest/meta-data/'
_URL_CMD_OP=$($_URL_CMD)
[[ $# -lt 1 ]] && { echo  "Usage $0 <Metadata Input>"; exit 0 ; }
KEY_LIST=$(echo $_URL_CMD_OP|tr -s "\n" " ")
#echo $KEY_LIST
for i in  $KEY_LIST
do
        _SUB_URL_CMD=$_URL_CMD$1
        OUT=$($_SUB_URL_CMD)
        #echo $OUT
        RET=`echo $OUT|grep '<title>404 - Not Found</title>'`
        [[ $? == 0 ]] && echo "Inavlid Input" || $($_SUB_URL_CMD)
        #echo "Key=$i"
done


