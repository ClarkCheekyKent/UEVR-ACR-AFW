ACR AFW Single View Crash Fix v0.4

v0.4 repairs the rendering consistency flaw in v0.3. v0.3 changed the
paired-view decision at ten crash callers, while ACR has 39 direct callers
and may also query the predicate indirectly. Omitted native consumers still
selected paired buffer strides and instanced draw counts for a single view.
The replay test reproduces unpaired crash setup together with a 32-byte
paired buffer stride and two draw instances under the v0.3 fixture.

The new DLL has one mid-function hook in the paired-view predicate's original
true-return path at acr+0x434a577. Every original predicate condition runs first.
RBX still holds the view argument. If the original partner lookup returns null,
the hook redirects to the native false-return epilogue at acr+0x434a57f.
If a partner exists, the entire register context remains untouched.
The original false-return path does not enter the hook or perform an extra lookup.
Every native or indirect consumer now receives the same consistent classification.

The decision matches the original working MonoCompatibility guard in the tested
nine view/family cases. v0.4 implements this in the native predicate return path,
with preserved native context, RAII hook ownership, explicit code signatures,
and disabled preparation plus relocation validation before activation.
The ten v0.3 caller hooks are removed. No caller instruction is hooked.

The native partner lookup stays unchanged. View flags, stereo-pass fields,
camera/object matrices, motion-vector textures, AFW history buffers and AFW
settings are not written by the plugin. The UEVR backend and color fix are unchanged.
The game executable on disk remains intact.

Supported ACR executable: x64, PE timestamp 050dbf19, image size 0c143000.
Exact original predicate, lookup, helper and crash-block signatures are checked.
An existing original MonoCompatibility or v0.3 hook prevents installation.
A hook overlapping the false-return epilogue is rejected before activation.

Installation: before injection, put ACR_AFWSingleViewCrashFix.dll in
%APPDATA%\UnrealVRMod\acr\plugins.
Disable ACR_MonoCompatibility.dll and every earlier SingleViewCrashFix DLL.
Keep only v0.4 active. If ACR is already injected, close it and relaunch before
injecting again; changing DLL files cannot replace hooks in a running session.
An open game without UEVR injected can use the new plugin at its first injection.

Use UEVR-nightly01143-AFW-colorfix-clean. Check the log for:
[ACR SingleViewCrashFix] v0.4 installed: consistent paired-view classification...
On the first missing partner it logs once that the predicate now returns false
consistently for every consumer.

Validation: Release x64 build and 1,145 checks passed in a separate test process.
Exact ACR native machine code replays the original crash block and its real
predicate/partner helpers. A v0.3 fixture reproduces the inconsistent layout.
v0.4 corrects crash setup, native buffer stride and native instance count together.
Valid paired and non-instanced cases retain native outputs. All ten captured
branch fixtures and all 39 captured direct CALL sites receive consistent decisions.
Concurrent indirect queries preserve view/family memory and classification.
Preparing the hook disabled leaves bytes original; the six-byte relocation
preserves the false-return epilogue; activation changes only the true-return bytes;
removal restores original code. Register context stays native for valid partners.

These tests verify the concrete consistency repair, not final headset pixels.
The user still needs to verify AFW selection and moving-car stereo output in-game.

Build with the main CMake project target ACR_AFWSingleViewCrashFix.
