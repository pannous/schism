#!/bin/sh
# Copyright 2019 Google LLC
# Usage:
#
# Compile schism-stage0.wasm from schism/compiler.ss, using Guile to
# interpret the Schism compiler:
#   ./bootstrap-from-guile.sh
#   ./bootstrap-from-guile.sh schism-stage0.wasm schism/compiler.ss

exec ${GUILE-guile} ./bootstrap-from-guile.scm "$@"
