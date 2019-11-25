// Copyright 2019 Google LLC

// Null implementation of the Schism Filesystem interface.
//
// This is a fake file system where all files exist but are empty.

export default {
    open: (filename) => {
        return {
            readContents: () => ""
        };
    }
};
