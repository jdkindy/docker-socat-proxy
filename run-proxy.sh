#!/bin/bash
# Redirecting output to /dev/null in case DST_HOST is not responding
/usr/bin/socat tcp-listen:${LSTN_PORT},reuseaddr,fork tcp:${DST_HOST}:${DST_PORT} 2>/dev/null
