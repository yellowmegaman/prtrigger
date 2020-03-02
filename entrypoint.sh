#!/bin/sh

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN environment variable."
  exit 1
fi

echo "$GITHUB_REPOSITORY"
echo "$GITHUB_ACTOR"

apt update
apt install curl jq -y

curl -s -H "Accept: application/vnd.github.v3+json" -X GET "https://api.github.com/repos/$GITHUB_ACTOR/$GITHUB_REPOSITORY/pulls" | jq -r '.[].head.ref'
