#!/bin/bash
$QUERY="$1"
curl 'https://api.dehashed.com/search?query=' \
-u $DEHASH_AUTH \
-H 'Accept: application/json'