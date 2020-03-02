#!/bin/sh

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN environment variable."
  exit 1
fi

echo "$GITHUB_REPOSITORY"
echo "$GITHUB_ACTOR"

curl -s -H 'authorization: Bearer ${{ secrets.GITHUB_TOKEN }}' -H "Accept: application/vnd.github.v3+json" -X GET "https://api.github.com/repos/$GITHUB_REPOSITORY/pulls" | jq -r '.[].head.ref'
