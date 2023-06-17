# this file is loaded at ~/.profile
# with adding line . ~/kosteus/.profile

. ~/kosteus/.env

alias ll="ls -lah"
cd $ROOT_DIRECTORY

alias wsock="cd $ROOT_DIRECTORY/status_files; nohup websocat -tvvv autoreconnect:ws://$(cat $ROOT_DIRECTORY/status_files/kappe_ip):$WEBSOCKET_PORT writefile:$ROOT_DIRECTORY/status_files/websocket_output --ping-interval 60 & >> $ROOT_DIRECTORY/wsock_stout.log 2>> $ROOT_DIRECTORY/wsock_error.log"
alias wsockint="cd $ROOT_DIRECTORY/status_files; nohup bash $ROOT_DIRECTORY/websocket_interpreter.sh & >/dev/null"
