#!/system/bin/sh
MODDIR=${0%/*}
supolicy --live "allow system_server system_server process {execmem}"
supolicy --live "allow coredomain coredomain process {execmem}"
supolicy --live "allow coredomain app_data_file * *"
supolicy --live "allow zygote apk_data_file * *"
