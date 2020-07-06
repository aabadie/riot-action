#!/bin/bash

set -e

export CI_BASE_BRANCH=${CI_BASE_BRANCH}

cd ${GITHUB_WORKSPACE} && bash -c "${INPUT_CMD}"
