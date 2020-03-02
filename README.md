# prtrigger

A GitHub Action for triggering pr checks after master is updated.


## Features
 * Create empty commit to trigger check re-run on GH actions

## Usage

### GitHub Actions
```
# File: .github/workflows/prtrigger.yml

on:
  push:
    branches:
    - master
jobs:
  pull-request:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: pull-request
      uses: yellowmegaman/prtrigger@v0.8
      with:
        github_token: ${{ secrets.PERSONAL_TOKEN }}
```

This will automatically commit to every PR branch to re-run checks.

## Advanced options
```
on:
  push:
    branches:
    - master
jobs:
  pull-request:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: pull-request
      uses: yellowmegaman/prtrigger@v0.8
      with:
        github_token: ${{ secrets.PERSONAL_TOKEN }}
        commit_message: "your default commit message for trigger"
        git_user: "serviceaccount"
        git_email: "serviceaccount@org.io"
```
