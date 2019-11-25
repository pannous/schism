// Copyright 2019 Google LLC

// Implementation of the Schism Filesystem interface for Node.

import fs from 'fs';

export default {
    open: (filename) => {
        return {
            readContents: () => fs.readFileSync(filename)
        };
    }
};
