#!exec /usr/bin/env node --harmony --experimental-modules --experimental-wasm-anyref --experimental-wasm-return-call
// -*- javascript -*-
import * as Schism from './rt/rt.mjs';
import filesystem from './rt/filesystem-node.js';
import {compileWithHostScheme, stage0_compile} from './run-utils.mjs';

import assert from 'assert';
import fs from 'fs';

Error.stackTraceLimit = 20;

let test = "test.ss"
//_todo :
let test1= `(library (trivial)
    (import (rnrs))
    (export test)
    (define (test) (write 'OK))
)`;
// let test = "./test/char-numeric-yes.ss";
console.log(test)

async function runTest(name, compile = compileWithHostScheme) {
    try {
        const bytes = name.indexOf(".ss")>0?fs.readFileSync(name):name.toBytes();
        const file = await compile(bytes);
        fs.writeFileSync('test.wasm', file);
        const engine = new Schism.Engine({filesystem});
        const wasm = await engine.loadWasmModule(file);
        let exports = wasm.exports;
        let result=exports.test? exports.test(): exports.main()
        // if((""+result).indexOf("sS")==0)result=result.substr(2)
        if((""+result).indexOf("Ss")==0)result=result.substr(2)
        if(isFinite(result))result=result/2
        console.log("result",result,"type",typeof result) // /2 WTF
    } catch (e) {
        console.error(e.stack.replace(/file:\/\//g,""))
        // throw e;
    }
}

runTest(test, stage0_compile);
