# Changelog

## 0.2.0-beta

Pad is now **Pagina**, a PDF editor, not just a margin tool. Switch modes at the top of the window (⌘1–⌘3).

### Edit PDF text

- Click a line of text in Annotate mode, change it in place, and press Return. The old text is removed from the file, not just covered, and the new text can be searched and copied.
- The size, color, and style (regular, bold, or serif) of the original line are kept. Edited lines use Apple SD Gothic Neo or AppleMyungjo, embedded with only the characters used.
- An edited line can be edited again.
- Powered by [PDFium](https://pdfium.googlesource.com/pdfium/) (BSD license).

### Pages

- Thumbnail grid: drag to reorder, rotate, delete, duplicate
- Insert blank pages or pages from another PDF
- Extract selected pages to a new PDF

### Annotate

- Highlight, underline, and strikethrough text
- Text boxes, pen, rectangles, ovals, and arrows, with colors and line widths
- Draw a signature once and place it anywhere
- Eraser for annotations

### Tools menu

- Compress a PDF
- Export pages as PNG or JPEG (150 or 300 dpi)
- Create a PDF from images
- Recognize text in scanned pages (OCR, Korean and English) so it can be searched and copied
- Merge PDFs

### Other changes

- The original's vertical position is now a slider, like the horizontal one
- Margins now include annotations
- Save (⌘S), Save As (⌘⇧S), Revert, and Undo/Redo for every edit. Pagina asks before quitting with unsaved changes.

## 0.1.0-beta

First beta of Pad, a macOS app that adds note-taking margins to PDFs. It replaces the old Python scripts, which are now in `legacy/`.

### Highlights

- **Drag and drop** PDFs onto the window or the Dock icon, or add them with ⌘O
- **Live preview** that updates as you change the options, with the original's area outlined
- **Page size**: width and height ratios. The defaults (1.8× × 1.2×) match the old `pdf4.py`.
- **Original position**: horizontal slider and top, middle, or bottom
- Optional **blank first page**
- **Save to** iCloud Drive, the original's folder, or a folder you choose
- Rotated pages and crop boxes are handled. Text stays vector and selectable.
- English and Korean UI (Settings → Language)
- No Python required

### Requirements

- macOS 15 or later, Apple Silicon or Intel

### Known limitations

- The app is not notarized by Apple yet. The install script handles this for you; for a manual install, see the README.
- Links, other annotations, and the outline (bookmarks) are not copied to the result.
