// -*- javascript -*-
//
// Copyright 2018 Google LLC

import { stage2_bytes } from './run-utils.mjs';

import fs from 'fs';

console.info("Compiling stage2 compiler");
stage2_bytes().then((bytes) => {
  console.info("Saving current stage2 compiler as new stage0 snapshot");
  fs.writeFileSync('schism-stage0.wasm', bytes);
})
