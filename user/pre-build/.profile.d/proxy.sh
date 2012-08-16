#!/bin/sh

setup_proxy(){
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY

  if [ $BEHIND_PROXY -ne 1 ]
  then 
    return
  fi

  http_proxy=http://$PROXY_IP:$PROXY_PORT/
  https_proxy=https://$PROXY_IP:$PROXY_PORT/

  if [ $REQUIRE_AUTH -eq 1 ]
  then
    http_proxy=http://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
    https_proxy=https://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  fi
  
  HTTP_PROXY=$http_proxy
  HTTPS_PROXY=$https_proxy

  export http_proxy
  export https_proxy
  export HTTP_PROXY
  export HTTPS_PROXY
}

setup_proxy
