#!/bin/sh

echo "Environments:"
env
echo "---"

apk add --no-cache build-base jq-dev git \
  && bundle \
  && rake
