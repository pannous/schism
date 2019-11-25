// -*- javascript -*-
//
// Copyright 2018, 2019 Google LLC

import * as Schism from './rt/rt.mjs';
import filesystem from './rt/filesystem-node.js';

import child_process from 'child_process';
import fs from 'fs';
import util from 'util';
import root from './root.cjs';

const compilerPath = root.join('schism/compiler.ss');

export const OPTIONS = {
    use_snapshot: true, // load schism-stage0.wasm if true instead of
                         // building with host scheme

    // which stages to build and run tests for
    stage0: true,
    stage1: true,
    stage2: true,
    stage3: true, // compile-only, no point running tests
}

// Returns the contents of out.wasm
export async function compileWithHostScheme(name) {
    const { stdout, stderr } = await util.promisify(child_process.exec)(`./schism.ss ${name}`);

    return util.promisify(fs.readFile)('out.wasm');
}

// Uses host scheme to compile schism and returns the wasm bytes
async function compileBootstrap() {
    return compileWithHostScheme('./schism/compiler.ss');
}

function make_compiler(compiler_bytes) {
  return async function(bytes) {
    const engine = new Schism.Engine({ filesystem });
    const schism = await engine.loadWasmModule(await compiler_bytes());
    engine.setCurrentInputPort(bytes);
    schism.exports['compile-stdin->stdout']();
    return new Uint8Array(engine.output_data);
  }
}

function make_cache(thunk) {
  let cache = undefined;
  return () => {
    if (!cache) {
      cache = thunk();
    }
    return cache;
  };
}

// The stage0 bytes, either loaded from a snapshot
// (schism-stage0.wasm) or compiled by the host Scheme.
export const stage0_bytes = make_cache(() =>
  OPTIONS.stage0 ? (async function() {
    return OPTIONS.use_snapshot
	? fs.readFileSync(root.join('schism-stage0.wasm'))
	: await compileBootstrap()
  })() : undefined);
// Compile bytes using the stage0 compiler.
export const stage0_compile = OPTIONS.stage0 ? make_compiler(stage0_bytes) : undefined;
export const stage1_bytes = make_cache(async () => {
  if (!OPTIONS.stage1) { return undefined; }
  const bytes = await stage0_compile(fs.readFileSync(compilerPath));
  fs.writeFileSync(root.join('schism-stage1.wasm'), bytes);
  return bytes;
});

export const stage1_compile = OPTIONS.stage1 ? make_compiler(stage1_bytes) : undefined;
export const stage2_bytes = make_cache(async () => {
  if (!OPTIONS.stage2) { return undefined; }
  const bytes = await stage1_compile(fs.readFileSync(compilerPath));
  fs.writeFileSync(root.join('schism-stage2.wasm'), bytes);
  return bytes;
});

export const stage2_compile = OPTIONS.stage2 ? make_compiler(stage2_bytes) : undefined;
export const stage3_bytes = make_cache(async () => {
  if (!OPTIONS.stage3) { return undefined; }
  const bytes = await stage2_compile(fs.readFileSync(compilerPath));
  fs.writeFileSync(root.join('schism-stage3.wasm'), bytes);
  return bytes;
});
