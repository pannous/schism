#!/bin/sh
":" //# comment; exec /usr/bin/env node --harmony --experimental-modules --experimental-wasm-anyref --experimental-wasm-return-call "$0" "$@"

// ^^ TRICK to get wasm --harmony > --experimental-modules

// #!exec /usr/bin/env node --harmony --experimental-modules --experimental-wasm-anyref --experimental-wasm-return-call
// -*- javascript -*-
import * as Schism from './rt/rt.mjs';
import filesystem from './rt/filesystem-node.js';
import {compileWithHostScheme, stage0_compile} from './run-utils.mjs';

import assert from 'assert';
import fs from 'fs';

Error.stackTraceLimit = 20;

let test = "test.ss";
let test2 = "test2.ss";
let test1 = `(library (trivial)
    (export test)
    (import (rnrs))
    (define (test) (write 'OK) 42)
)`;
if (process.argv.length > 2)
    test = process.argv[2];
else console.log("USAGE:\n /schism.mjs test.ss\n or later\n /schism.mjs test.wasm")
// let test = "./test/char-numeric-yes.ss";
console.log(test);

async function runTest(name, compile = compileWithHostScheme) {
    try {
        let wasm
        if (test.endsWith(".wasm")) {
            wasm = fs.readFileSync(test);
        } else {
            const lisp = name.indexOf(".ss") > 0 ? fs.readFileSync(name) : new Buffer(name);
            wasm = await compile(lisp);
            fs.writeFileSync('test.wasm', wasm);
        }
        const engine = new Schism.Engine({filesystem});
        const module = await engine.loadWasmModule(wasm);
        let exports = module.exports;
        let result = exports.test ? exports.test() : exports.main();
        // if((""+result).indexOf("sS")==0)result=result.substr(2)
        if (("" + result).indexOf("Ss") == 0) result = result.substr(2);
        if (isFinite(result) && result > 1) result = result / 2;
        if (result == 1) result = true;
        if (result == 0) result = false;
        console.log("result", result, "\ntype", typeof result) // /2 WTF
    } catch (e) {
        console.error(e.stack.replace(/file:\/\//g, ""))
        // throw e;
    }
}

runTest(test, stage0_compile);
