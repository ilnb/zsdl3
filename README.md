# ZSDL3 — Zig bindings for SDL3

[![Zig](https://img.shields.io/badge/Zig-0.16.0+-orange.svg)](https://ziglang.org)
[![SDL3](https://img.shields.io/badge/SDL-3.2.0+-blue.svg)](https://www.libsdl.org/)

Thin, zero-overhead bindings for SDL3, SDL3_image, and SDL3_ttf — without `@cImport`.

---

## Install

```bash
# macOS
brew install sdl3 sdl3_ttf sdl3_image
# Linux (Debian/Ubuntu)
sudo apt install libsdl3-dev
# Linux (Arch)
sudo pacman -S sdl3
# Linux (Fedora)
sudo dnf install SDL3-devel SDL3_image SDL3_ttf
# Windows — download from https://github.com/libsdl-org/SDL/releases
```

Or build SDL3 from source.

## Depend on it

```bash
zig fetch --save git+https://github.com/ilnb/zsdl3.git
```

Then in `build.zig`:

```zig
const zsdl3 = b.dependency("zsdl3", .{});
exe.root_module.addImport("zsdl3", zsdl3.module("zsdl3"));
exe.root_module.linkSystemLibrary("SDL3", .{});
```

## Build

```bash
git clone https://github.com/felixuxx/zsdl3.git
cd zsdl3
zig build          # builds main binary + all examples
zig build run      # run the app
```

### Run examples

| Step | Example |
|---|---|
| `zig build run-basic-2d` | window + yellow rect |
| `zig build run-cube-3d` | rotating 3D cube |
| `zig build run-gpu-test` | GPU device + shader formats |
| `zig build run-image-test` | load PNG via SDL3_image |
| `zig build run-ttf-example` | render TTF text |
| `zig build run-text-editor` | text editor with file dialogs |
| `zig build run-test-enhanced-renderer-visual` | renderer smoke test |

## Usage

Checkout examples.

All functions use short Zig-friendly names (`init`, `createWindow`, `pollEvent`). Full API at [SDL3 Wiki](https://wiki.libsdl.org/SDL3/APIByCategory).

## Structure

```
src/     — 50+ subsystem files (core, video, render, gpu, audio, image, ttf, …)
examples/ — 7 runnable examples
```

---

**License:** zlib (same as SDL3) — see [LICENSE](LICENSE).
