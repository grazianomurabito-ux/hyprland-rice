#!/usr/bin/env python3
"""Divide gli sfondi in scuri/chiari (hard link, nessuno spazio extra)."""
import os
import sys
from pathlib import Path

from PIL import Image, ImageStat

SRC = Path(os.environ.get("WALL_SRC", Path.home() / "Pictures" / "wallpapers"))
DST = Path(os.environ.get("WALL_DST", Path.home() / "Pictures" / "wallpapers-mode"))
SOGLIA = float(sys.argv[1]) if len(sys.argv) > 1 else 0.45
EXTS = {".jpg", ".jpeg", ".png", ".webp", ".bmp"}


def luminosita(path):
    with Image.open(path) as im:
        im = im.convert("L")
        im.thumbnail((200, 200))
        return ImageStat.Stat(im).mean[0] / 255


def main():
    for sub in ("dark", "light"):
        d = DST / sub
        d.mkdir(parents=True, exist_ok=True)
        for f in d.iterdir():
            f.unlink()
    n = {"dark": 0, "light": 0}
    for p in sorted(SRC.iterdir()):
        if not p.is_file() or p.suffix.lower() not in EXTS:
            continue
        try:
            lum = luminosita(p)
        except Exception as e:
            print(f"saltato {p.name}: {e}")
            continue
        sub = "dark" if lum < SOGLIA else "light"
        target = DST / sub / p.name
        try:
            os.link(p, target)
        except OSError:
            import shutil
            shutil.copy2(p, target)
        n[sub] += 1
        print(f"{sub:5}  {lum:.2f}  {p.name}")
    print(f"\nScuri: {n['dark']}  Chiari: {n['light']}  (soglia {SOGLIA})")


if __name__ == "__main__":
    main()
