#!/bin/bash
CANDY_URL='https://www.coingecko.com/account/candy?locale=en'
CANDY_CHECK_IN_URL='https://www.coingecko.com/account/candy/daily_check_in?locale=en'
CANDY_COOKIE='cookie: __xxxx=xxx'

function log {
  local message=$1
  now=$(date +'%F %R')
  echo "$now": "$message" >> logs.txt
}

function getToken {
	token=$(curl -s "$CANDY_URL" -H "$CANDY_COOKIE" --compressed | grep authenticity_token | awk  -F 'name="authenticity_token" value="' '{print $2}' | awk -F '" ' 'NR==1{print $1}')

  if [ -z "$token" ]
  then
    log "candy claimed already!"
    return
  fi

  result=$(curl -s -XPOST "$CANDY_CHECK_IN_URL" -H "$CANDY_COOKIE" --data-urlencode "authenticity_token=$token" --compressed)
  if [ -z "$result" ]; then
    log "candy claimed successfuly!"
  else
    log "failed to claim candy!"
  fi
}

getToken
