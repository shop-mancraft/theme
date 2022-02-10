#!/bin/sh
if ! command -v cloudflared &> /dev/null
then
    printf "[ ERROR ] cloudflared daemon not found -> https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation \n"
    exit 0
fi

FILE=.env
if [ -f "$FILE" ] && [ -z "$2" ] ; 
then
    printf "[ CF TOKEN RETRIEVED - use 'npm run cf_token' to generate new one or remove file if you are redirect to %s] \n" "$1"
else 
    command cloudflared access login "$1"
    printf "CF_TOKEN=%s" "$(cloudflared access token -app="$1")" > .env
    printf "[ CF TOKEN GENERATED ] \n"
fi