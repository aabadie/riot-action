#!/bin/bash

set -e

cd ${GITHUB_WORKSPACE} && sh -c "$*"
