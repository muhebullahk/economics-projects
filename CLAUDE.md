# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal workspace repository for an economics instructor. It holds teaching materials, Python scripts, LaTeX documents, and reference sheets — organized by type and academic term.

## Folder structure

- `Teaching/` — course materials organized by term (`Fall2026/`, `Winter2027/`) then course code (e.g. `ECON101/`). Each course folder contains subfolders like `Slides/`, `Quizzes/`, `MT1/`, `MT2/`, `Final Exam/`, `Practice Problem Sets/`.
- `Python/` — subdivided into `Projects/`, `Practice/`, `Data/`, and `Notebooks/`.
- `LaTeX/` — LaTeX source files and compiled documents.
- `Research/` — research-related files.
- `Commands for VS Code/` — a LaTeX cheat sheet (`Commands Sheet.tex`) compiled to PDF covering VS Code shortcuts, terminal commands, Git basics, and folder management.

## Common commands

**Run a Python file:**
```bash
python3 path/to/file.py
```

**Compile a LaTeX file to PDF:**
```bash
pdflatex "Commands for VS Code/Commands Sheet.tex"
```
Run `pdflatex` twice if cross-references or the table of contents need updating.

**Clean LaTeX build artifacts** (`.aux`, `.log`, `.out`, `.synctex.gz`):
```bash
rm -f *.aux *.log *.out *.synctex.gz
```
