// Copyright 2019 Google LLC

const path = require('path');
const root = __dirname;

exports.path = root;
exports.join = (...args) => path.join.apply(path, [root, ...args]);
