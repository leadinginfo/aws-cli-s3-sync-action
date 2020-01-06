#!/bin/sh

set -e

aws s3 sync ${INPUT_FROM} ${INPUT_TO} $*

