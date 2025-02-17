// -*- javascript -*-
//
// Copyright 2019 Google LLC

import { stage1_bytes, stage2_bytes, stage3_bytes } from './run-utils.mjs';
import { performance } from 'perf_hooks';

function format_time(t) {
    return (Math.round(t) / 1000) + " s";
}

console.info("Compiling stage1 compiler...")
const stage1_start = performance.now();
stage1_bytes().then(() => {
    const stage1_end = performance.now();
    const stage1_time = stage1_end - stage1_start;
    console.info("  Time: " + format_time(stage1_time));
    console.info("");
    console.info("Compiling stage2 compiler...");
    const stage2_start = performance.now();
    stage2_bytes().then(() => {
        const stage2_end = performance.now();
        const stage2_time = stage2_end - stage2_start;
        console.info("  Time: " + format_time(stage2_time));
        console.info("");
        console.info("Compiling stage3 compiler...");
        const stage3_start = performance.now();
        stage3_bytes().then(() => {
            const stage3_end = performance.now();
            const stage3_time = stage3_end - stage3_start;
            console.info("  Time: " + format_time(stage3_time));
            console.info("");
            console.info("Percent change (1 -> 3): " + Math.round((stage3_time / stage1_time - 1) * 100) + "%");
            console.info("Percent change (2 -> 3): " + Math.round((stage3_time / stage2_time - 1) * 100) + "%");
        })
    })
});
