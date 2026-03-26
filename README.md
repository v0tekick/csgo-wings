# CS:GO Wings (In-Air Kills)

This SourceMod plugin brings the "wings" mechanic from Counter-Strike 2 into CS:GO. Whenever a player gets an in-air kill, a brand new wings icon will appear in the killfeed.

## Features
- **CS2-like In-Air Kills:** Displays a wings icon in the killfeed for kills made while jumping/falling.
- **Works with all expected weapons:** Applies to primary weapons, secondary weapons, zeus, and knives.
- **Excludes Grenades:** Explicitly ignores grenade kills (HE, Flashbang, Smoke, Decoy, Molotov/Incendiary), as per CS2 behavior.
- **No Icon Replacement:** Uses a custom SVG icon appended to the weapon string (e.g., `ak47_inair`), leaving standard killfeed icons intact for normal kills.
- **No FastDL Required:** Players do not need to download anything manually. The plugin uses `AddFileToDownloadsTable` to send the tiny `.svg` icons directly to connecting players, eliminating the need for an external web file storage server.

## Installation Instructions

1. **Compile the Plugin**
   - Take the `csgo_wings.sp` source code and compile it using the [SourceMod Compiler](https://spider.limetech.io/).
   - You will get a file named `csgo_wings.smx`.

2. **Upload the Plugin**
   - Place the compiled `csgo_wings.smx` file into your server's `csgo/addons/sourcemod/plugins/` directory.

3. **Upload the Icons**
   - This repository contains a `materials/` folder with all the generated `_inair.svg` icons.
   - Upload the entire `materials/` folder to your server's root `csgo/` directory (so the path looks like `csgo/materials/panorama/images/icons/equipment/...`).

4. **Restart the Server / Change the Map**
   - Reload the map or restart the server.
   - The plugin will automatically load and push the necessary icons to connecting players.

## Repository Structure
- `csgo_wings.sp` - The SourceMod plugin source code.
- `materials/` - The hand-crafted merged SVG icons that the game client needs to render the killfeed.