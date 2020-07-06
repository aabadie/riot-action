#!/bin/bash

set -e

git config --system user.name "riot" && \
git config --system user.email "ci@riot-os.org"
export CI_BASE_BRANCH=origin/master

cd ${GITHUB_WORKSPACE}&& git fetch origin master && bash -c "${INPUT_CMD}"
