#!/bin/sh

if [ $REQUIRE_AUTH -eq 1 ]
then
  if [ $BEHIND_PROXY -ne 1 ] 
  then
    echo "BEHIND_PROXY does not set to 1 while REQURE_AUTH is set !"
    echo "Forcely set BEHIND_PROXY"
    export BEHIND_PROXY=1
  fi
fi

if [ $REQUIRE_AUTH -eq 1 ]
then
  export http_proxy=http://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  export https_proxy=https://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
fi

if [ $REQUIRE_AUTH -ne 1 ]
then
  export http_proxy=http://$PROXY_IP:$PROXY_PORT/
  export https_proxy=https://$PROXY_IP:$PROXY_PORT/
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
fi

if [ $BEHIND_PROXY -ne 1 ] 
then
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset GIT_PROXY_COMMAND
fi
