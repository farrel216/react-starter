#!/usr/bin/env sh

set -x
npm run preview &
sleep 1
echo $! > .pidfile
set +x