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

  export http_proxy=http://$PROXY_IP:$PROXY_PORT/
  export https_proxy=https://$PROXY_IP:$PROXY_PORT/

  if [ $REQUIRE_AUTH -eq 1 ]
  then
    export http_proxy=http://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
    export https_proxy=https://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  fi
  
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
}

setup_proxy
