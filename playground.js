//
// Copyright 2018 Google LLC

import * as Schism from  './rt/rt.js';
import filesystem from './rt/filesystem-null.js';

async function compileSchism() {
  const schism_bytes = await fetch('schism-stage0.wasm', { credentials: 'include' });
  const engine = new Schism.Engine({ filesystem });
  const schism = await engine.loadWasmModule(await schism_bytes.arrayBuffer());
  console.info('Loading Schism Complete');
  return { schism, engine };
}

const compiler = compileSchism();

async function compileAndRun() {
  const src = document.getElementById('src').value;
  console.info(`Compiling program: '${src}'`);
  const { schism, engine } = await compiler;

  engine.setCurrentInputPortChars(src);
  engine.output_data.length = 0;
  schism.call('compile-stdin->stdout');
  const bytes = new Uint8Array(engine.output_data);
  engine.output_data.length = 0;

  console.info("Compilation complete, executing program");

  const mod = await engine.loadWasmModule(bytes);

  engine.setCurrentInputPort('');
  const result = mod.call('main');

  document.getElementById('result').innerHTML = "" + result;

  console.info("Done");
}

document.getElementById('go').addEventListener('click', () => {
  compileAndRun();
});
