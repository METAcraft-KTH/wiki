+++
title = 'Shaders'
date = 2026-10-30
categories = ['Technical changes']
+++

If you play with a **shaderpack** (Iris or OptiFine), the pack replaces the shaders that draw the [[patches]] on your [[ovve]] and the rifts, so you see plain ovvar and flat, still rifts. The **shader patcher** fixes this: it makes a patched **+ovvar copy** of your shaderpacks. Your original packs are never changed.

You only do this once, and again whenever you add or update a shaderpack.

## Before you start

**Get the patcher.** In game, type `/ovvar shaders` and click the green link. The file is called `ovvar-shader-patcher.jar` or `OvvarShaderPatcher.jar`, which is the same thing.

**It does not matter where you put it.** Your Downloads folder is fine. The patcher does not look in the folder it is in. It goes straight to Minecraft's own shaderpacks folder:

System | Folder it patches
--- | ---
Windows | `%APPDATA%\.minecraft\shaderpacks`
macOS | `~/Library/Application Support/minecraft/shaderpacks`
Linux | `~/.minecraft/shaderpacks`

That is the folder of the normal Minecraft Launcher. **If you use Prism, Modrinth App, CurseForge or another launcher**, your shaderpacks are somewhere else and the patcher will not find them on its own: see [Other launchers](#other-launchers).

**You need Java 11 or newer.** The Java that comes with Minecraft does not count, since other programs cannot use it. If you are not sure, just try the steps below: they tell you if Java is missing, and [No Java](#no-java) says what to do.

## Windows

1. Close Minecraft.
2. Double-click the patcher.
3. After a few seconds a box called **Ovvar shader patcher** pops up with a list of your packs and a last line like `2 pack(s) patched, 0 skipped, 0 failed.` Click OK.
4. Start Minecraft and [pick the +ovvar pack](#picking-the-pack-in-game).

**Did it open in WinRAR or 7-Zip instead, or did nothing happen?** Windows does not know the file is a Java program. Do this instead:

1. Press the Windows key, type `cmd` and press Enter. A black window opens.
2. Type `java -jar ` (with a space at the end).
3. Drag the patcher from your folder into the black window. Its path appears.
4. Press Enter. The same list is printed in the window.

## macOS

The Terminal is the easiest way on a Mac, and it also skips Apple's "unidentified developer" warning.

1. Close Minecraft.
2. Open **Terminal** (press Cmd + Space, type `Terminal`, press Enter).
3. Type `java -jar ` (with a space at the end).
4. Drag the patcher from Finder into the Terminal window. Its path appears.
5. Press Enter. You should see `Shaderpacks folder: ...`, a line for each pack ending in `-> SomePack+ovvar.zip`, and a last line like `2 pack(s) patched, 0 skipped, 0 failed.`
6. Start Minecraft and [pick the +ovvar pack](#picking-the-pack-in-game).

**Prefer double-clicking?** The first time, macOS says the file "cannot be opened because it is from an unidentified developer" (or "Apple could not verify..."). That is because it is not signed by Apple, not because something is wrong with it. To allow it:

* **macOS 14 and older:** Control-click (or right-click) the patcher, choose **Open**, then **Open** again.
* **macOS 15 and newer:** double-click once and close the warning. Open **System Settings → Privacy & Security**, scroll down, click **Open Anyway** next to the patcher and confirm.

A double-click may finish without showing any message. Look in your shaderpacks folder: if there are files ending in `+ovvar`, it worked.

## Linux

1. Close Minecraft.
2. Open a terminal.
3. Type `java -jar ` (with a space at the end), drag the patcher into the terminal (or type its path, like `~/Downloads/ovvar-shader-patcher.jar`) and press Enter.
4. You should see `Shaderpacks folder: ...`, a line for each pack ending in `-> SomePack+ovvar.zip`, and a last line like `2 pack(s) patched, 0 skipped, 0 failed.`
5. Start Minecraft and [pick the +ovvar pack](#picking-the-pack-in-game).

Double-clicking a jar on Linux usually opens it as an archive, so use the terminal.

## Picking the pack in game

**Iris:** Options → Video Settings → **Shader Packs...**, click the pack whose name ends in **+ovvar** (like `ComplementaryReimagined_r5.5+ovvar.zip`), then **Apply** and **Done**.

**OptiFine:** Options → Video Settings → **Shaders...** and click the pack ending in **+ovvar**.

When you add or update a shaderpack, run the patcher again and pick the new +ovvar copy. Running it again is safe: it just replaces the old copies.

## Problems

### No Java

You see `'java' is not recognized as an internal or external command` (Windows), `Unable to locate a Java Runtime` (macOS) or `java: command not found` (Linux).

Install Java from [adoptium.net](https://adoptium.net): the big Download button picks the right one for your computer. On Linux you can use your package manager instead, like `sudo apt install openjdk-21-jre` (Ubuntu, Debian), `sudo dnf install java-21-openjdk` (Fedora) or `sudo pacman -S jre-openjdk` (Arch). Then close and reopen the terminal and start over.

### Other launchers

You see `No shaderpacks folder found`, or the patcher patched the packs of the normal launcher instead of yours, or your pack is not in the list.

Your launcher keeps a shaderpacks folder for each instance or profile. Give the patcher your pack directly:

1. Find your shaderpacks folder. The easiest way: in game, go to Options → Video Settings → **Shader Packs...** and click **Open Shader Pack Folder** (OptiFine: **Shaders Folder**).
2. Open a terminal as described for your system above (on Windows, `cmd`).
3. Type `java -jar `, drag the patcher in and type a space.
4. Drag **your shaderpack's .zip** from that folder into the window too.
5. Press Enter. The +ovvar copy is written next to the pack, in the same folder.
6. Do 3 to 5 again for each pack you want patched.

Where the folder usually is (`<name>` is your instance or profile):

Launcher | Windows | macOS | Linux
--- | --- | --- | ---
Prism Launcher | `%APPDATA%\PrismLauncher\instances\<name>\minecraft\shaderpacks` | `~/Library/Application Support/PrismLauncher/instances/<name>/minecraft/shaderpacks` | `~/.local/share/PrismLauncher/instances/<name>/minecraft/shaderpacks`
Modrinth App | `%APPDATA%\ModrinthApp\profiles\<name>\shaderpacks` | `~/Library/Application Support/ModrinthApp/profiles/<name>/shaderpacks` | `~/.local/share/ModrinthApp/profiles/<name>/shaderpacks`
CurseForge | `%USERPROFILE%\curseforge\minecraft\Instances\<name>\shaderpacks` | `~/Documents/curseforge/minecraft/Instances/<name>/shaderpacks` | 

On older versions of Prism the inner folder is called `.minecraft` instead of `minecraft`.

### Nothing was patched

Message | Meaning
--- | ---
`0 pack(s) patched, 0 skipped, 0 failed.` | The folder it looked in is empty. Put your shaderpack's .zip there first, or see [Other launchers](#other-launchers).
`no shaders/ folder, not a shaderpack; skipped` | That file is not a shaderpack, often a resource pack in the wrong folder. Harmless.
`skipped` in the last line, nothing else wrong | Those are the +ovvar copies from last time, skipped on purpose. Harmless.
`nothing patched` or `failed` under a pack | That shaderpack is not supported yet. Tell us which pack and which version.

Known to work: BSL, Bliss, Complementary Reimagined and Unbound, MakeUp Ultra Fast, Solas, Photon and Super Duper Vanilla.

### No +ovvar pack in game

Close and reopen the Shader Packs screen (or restart Minecraft) so it reads the folder again. Also check that you are playing in the same launcher instance the patcher patched: the `Shaderpacks folder:` line says which folder it used.

{{< navbox "season6" >}}
