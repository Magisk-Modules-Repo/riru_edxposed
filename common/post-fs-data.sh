#!/system/bin/sh
MODDIR=${0%/*}
supolicy --live "allow system_server system_server process {execmem}"
supolicy --live "allow coredomain coredomain process {execmem}"
supolicy --live "allow coredomain app_data_file * *"
supolicy --live "attradd {system_app platform_app} mlstrustedsubject"
supolicy --live "allow zygote apk_data_file * *"
. ${MODDIR}/util_functions.sh
start_log_catchers
