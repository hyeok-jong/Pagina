# Pagina

A macOS PDF editor. Edit text right in the PDF, annotate and sign, manage pages, and add note-taking margins: Pagina widens every page and places the original on it, leaving room for handwritten notes on an iPad (GoodNotes, Notability, and so on).

> Status: **beta**. This repository hosts releases and the installer. The source code is private.

## Features

Pagina has three modes (⌘1–⌘3) and a Tools menu.

### Margins

- **Drag and drop**: drop PDFs on the window or the Dock icon, or use ⌘O
- **Live preview** of the result as you change the options
- **Page size**: width and height ratios (default 1.8× × 1.2×)
- **Original position**: horizontal (default 25% of the extra space on the left) and vertical (default top)
- **Blank first page** (optional)
- **Save to** iCloud Drive (default), the original's folder, or a folder you choose
- Output name: `Resized_<name>_w1.8_h1.2.pdf`. The original is never changed.
- Annotations you add in Pagina are kept. Links and the outline (bookmarks) are not copied.

### Pages

- Thumbnail grid: drag to reorder, rotate, delete, duplicate
- Insert blank pages or pages from another PDF, extract selected pages to a new PDF

### Annotate

- **Edit PDF text**: click a line, type, press Return. The old text is removed from the file, and the new text keeps the original size, color, and style.
- Highlight, underline, strikethrough
- Text boxes, pen, rectangles, ovals, arrows, signature, eraser

### Tools

- Compress, export pages as images, create a PDF from images, merge PDFs
- Recognize text in scanned pages (OCR, Korean and English)

Edits are saved to the original with ⌘S (or ⌘⇧S to save a copy), and every edit can be undone.

English and Korean UI. Pagina uses macOS's PDFKit and Vision, plus [PDFium](https://pdfium.googlesource.com/pdfium/) for text editing.

Text editing works one line at a time. Paragraphs do not reflow, and edited lines use a system font (Apple SD Gothic Neo or AppleMyungjo) because PDFs usually embed only the characters they already use.

## Install

Requires macOS 15 or later (Apple Silicon or Intel).

**Install script** (recommended)

```sh
curl -fsSL https://raw.githubusercontent.com/hyeok-jong/Pagina/main/install.sh | bash
```

The script downloads the latest release (including betas), verifies its checksum, and installs it to `/Applications` (or `~/Applications`).

**Manual**

Download `Pagina-<version>.zip` from [Releases](https://github.com/hyeok-jong/Pagina/releases) and unzip it into `/Applications`. Pagina is not notarized by Apple yet, so the first launch is blocked. Allow it in **System Settings → Privacy & Security → Open Anyway**, or run:

```sh
xattr -dr com.apple.quarantine /Applications/Pagina.app
```

## License

Copyright (c) 2026 hyeok-jong. All rights reserved. See [LICENSE](LICENSE).

Pagina includes open source components, including PDFium (BSD 3-Clause). See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
