# DSEQ
Disassembly of Mario's Picross's sound driver.

# Dependencies
- [RGBDS](https://github.com/gbdev/rgbds)

# Building
## Windows
Run `build.bat`.

## Linux and macOS
Run build.sh. If you get a "permission denied" error, run `chmod +x build.sh` and try again. On MacOS, you may need to [disable Gatekeeper](https://disable-gatekeeper.github.io/).

# Inserting custom music into a Mario's Picross ROM
## Requirements
- A Mario's Picross ROM
- A hex editor

## Instructions
1. Open the built ROM with your custom music in a hex editor and copy everything from address 0x4000 to the end of the file.
2. Open your Mario's Picross ROM in a hex editor and navigate to address 0x3C000. This is where the sound driver is located in a vanilla Mario's Picross ROM.
3. Paste the copied data from the built ROM in your Mario's Picross ROM at address 0x3C000, overwriting what was already there.
