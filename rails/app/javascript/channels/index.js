// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = import.meta.globEager("./**/*_channel.js");
// channels.keys().forEach(channels);
