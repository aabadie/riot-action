#!/bin/bash

set -e

RIOT_REPO="https://github.com/riot-os/riot.git"

cd ${GITHUB_WORKSPACE} && git fetch ${RIOT_REPO} master && bash -c "${INPUT_CMD}"
