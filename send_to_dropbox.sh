#!/bin/bash

. ~/kosteus/.env

curl -s -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $DROPBOX_AUTH_TOKEN" \
    --header "Dropbox-API-Arg: {\"path\": \"$1\"}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$1
