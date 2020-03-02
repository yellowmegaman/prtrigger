#!/bin/bash

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN environment variable."
  exit 1
fi

git config --global user.name "$INPUT_GIT_USER"
git config --global user.email "$INPUT_GIT_EMAIL"

for branch in $(curl -s -H "authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" -X GET "https://api.github.com/repos/$GITHUB_REPOSITORY/pulls" | jq -r '.[].head.ref'); do
	git clone "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY" -b "$branch" "$branch"
	pushd "$branch"
	git commit --allow-empty -m "$INPUT_COMMIT_MESSAGE"
	git push
	popd
done
