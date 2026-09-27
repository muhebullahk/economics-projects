#!/usr/bin/env python3
"""
md2tex.py  —  Convert ECON 230 markdown chapters to standalone LaTeX files.
Run from the Textbook directory:  python3 md2tex.py
"""

import re, os, sys

TEXTBOOK_DIR = os.path.dirname(os.path.abspath(__file__))

# ──────────────────────────────────────────────────────────────────────────────
# PREAMBLE
# ──────────────────────────────────────────────────────────────────────────────
def make_preamble(rh_header: str) -> str:
    rh = rh_header.replace('&', r'\&').replace('#', r'\#').replace('%', r'\%')
    return r"""\documentclass[12pt, letterpaper]{article}
\usepackage[top=2.5cm, bottom=2.5cm, left=3cm, right=2.5cm]{geometry}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{amsmath, amssymb}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{longtable}
\usepackage{array}
\usepackage{multirow}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{float}
\usepackage{listings}
\usepackage[most, breakable]{tcolorbox}
\usepackage{enumitem}
\usepackage{fancyhdr}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{microtype}
\usepackage[hidelinks]{hyperref}
\usepackage{parskip}

% Colours
\definecolor{econblue}{RGB}{31,78,121}
\definecolor{researchgreen}{RGB}{21,101,45}
\definecolor{exampleorange}{RGB}{180,80,20}
\definecolor{lightgray}{RGB}{245,245,245}
\definecolor{boxblue}{RGB}{220,235,248}

% Section headings
\titleformat{\section}{\large\bfseries\color{econblue}}{\thesection}{1em}{}%
  [\vspace{-4pt}\rule{\linewidth}{0.4pt}]
\titleformat{\subsection}{\normalsize\bfseries\color{econblue}}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{1em}{}

% Page style
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\itshape ECON 230 --- Introduction to Behavioural Economics}
\fancyhead[R]{\small\itshape """ + rh + r"""}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\setlength{\headheight}{14pt}

% tcolorbox styles
\tcbuselibrary{breakable, skins, listings}

\newtcolorbox{researchbox}{
  enhanced, breakable,
  colback=researchgreen!6, colframe=researchgreen!55,
  title=\textbf{Research Study},
  fonttitle=\bfseries\small,
  attach boxed title to top left={yshift=-2mm, xshift=6mm},
  boxed title style={colback=researchgreen!55, colframe=researchgreen!55},
  before upper={\setlength{\parskip}{4pt}}
}

\newtcolorbox{examplebox}[1]{
  enhanced, breakable,
  colback=exampleorange!6, colframe=exampleorange!45,
  title=\textbf{#1}, fonttitle=\bfseries\small
}

\newtcolorbox{keybox}{
  enhanced, colback=boxblue, colframe=econblue!70,
  fontupper=\small
}

% ASCII figure style
\lstset{
  basicstyle=\scriptsize\ttfamily,
  breaklines=false,
  keepspaces=true,
  columns=flexible,
  frame=single,
  backgroundcolor=\color{lightgray},
  xleftmargin=4pt, xrightmargin=4pt,
  aboveskip=6pt, belowskip=6pt
}

% Lists
\setlist[itemize]{leftmargin=1.5em, itemsep=2pt, topsep=4pt}
\setlist[enumerate]{leftmargin=1.5em, itemsep=2pt, topsep=4pt}
\onehalfspacing

\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
"""


# ──────────────────────────────────────────────────────────────────────────────
# TITLE PAGE
# ──────────────────────────────────────────────────────────────────────────────
def make_title_page(ch_num: str, ch_title: str) -> str:
    safe_title = tex_escape(ch_title)
    return (
        r"\begin{titlepage}" + "\n"
        r"\centering\vspace*{3cm}" + "\n"
        r"{\Large\bfseries\color{econblue} ECON 230 --- Introduction to Behavioural Economics\\[1em]}" + "\n"
        r"{\large\bfseries Course Textbook\\[2em]}" + "\n"
        r"{\LARGE\bfseries\color{econblue} Chapter " + ch_num + r"\\[0.5em]}" + "\n"
        r"{\Large\bfseries " + safe_title + r"\\[2em]}" + "\n"
        r"\vfill" + "\n"
        r"{\normalsize University of Northern British Columbia\\" + "\n"
        r"Instructor: Prof.\ Muhebullah Karimzada\\" + "\n"
        r"Term: Winter 2027}" + "\n"
        r"\end{titlepage}" + "\n"
        r"\tableofcontents" + "\n"
        r"\newpage" + "\n"
    )


# ──────────────────────────────────────────────────────────────────────────────
# TEXT ESCAPING (protects math/code, then escapes special chars)
# ──────────────────────────────────────────────────────────────────────────────
# Chars saved before escaping
_SAVES: list = []

def _protect(text: str, pattern: str, flags=0) -> str:
    def _sub(m):
        idx = len(_SAVES)
        _SAVES.append(m.group(0))
        return f'\x00SAVE{idx:04d}\x00'
    return re.sub(pattern, _sub, text, flags=flags)

def _restore(text: str) -> str:
    def _rsub(m):
        return _SAVES[int(m.group(1))]
    return re.sub(r'\x00SAVE(\d{4})\x00', _rsub, text)

_GREEK = {
    'α': r'$\alpha$', 'β': r'$\beta$', 'γ': r'$\gamma$',
    'δ': r'$\delta$', 'ε': r'$\varepsilon$', 'ζ': r'$\zeta$',
    'η': r'$\eta$', 'θ': r'$\theta$', 'ι': r'$\iota$',
    'κ': r'$\kappa$', 'λ': r'$\lambda$', 'μ': r'$\mu$',
    'ν': r'$\nu$', 'ξ': r'$\xi$', 'π': r'$\pi$',
    'ρ': r'$\rho$', 'σ': r'$\sigma$', 'τ': r'$\tau$',
    'υ': r'$\upsilon$', 'φ': r'$\phi$', 'χ': r'$\chi$',
    'ψ': r'$\psi$', 'ω': r'$\omega$',
    'Γ': r'$\Gamma$', 'Δ': r'$\Delta$', 'Θ': r'$\Theta$',
    'Λ': r'$\Lambda$', 'Ξ': r'$\Xi$', 'Π': r'$\Pi$',
    'Σ': r'$\Sigma$', 'Υ': r'$\Upsilon$', 'Φ': r'$\Phi$',
    'Ψ': r'$\Psi$', 'Ω': r'$\Omega$',
}

_UNICODE = {
    '→': r'$\rightarrow$',
    '←': r'$\leftarrow$',
    '↑': r'$\uparrow$',
    '↓': r'$\downarrow$',
    '↔': r'$\leftrightarrow$',
    '≈': r'$\approx$',
    '≠': r'$\neq$',
    '≤': r'$\leq$',
    '≥': r'$\geq$',
    '×': r'$\times$',
    '÷': r'$\div$',
    '·': r'$\cdot$',
    '∞': r'$\infty$',
    '∑': r'$\sum$',
    '∏': r'$\prod$',
    '∫': r'$\int$',
    '√': r'$\sqrt{\phantom{x}}$',
    '∂': r'$\partial$',
    '∈': r'$\in$',
    '∉': r'$\notin$',
    '⊂': r'$\subset$',
    '∪': r'$\cup$',
    '∩': r'$\cap$',
    '—': '---',
    '–': '--',
    '…': r'\ldots{}',
    '‘': '`',
    '’': "'",
    '“': '``',
    '”': "''",
    '•': r'\textbullet{}',
    '●': r'\textbullet{}',
    '✓': r'\checkmark{}',
    '✅': r'\checkmark{}',
    '©': r'\textcopyright{}',
    '®': r'\textregistered{}',
    '™': r'\texttrademark{}',
    '\xa0': '~',  # non-breaking space
}

# ──────────────────────────────────────────────────────────────────────────────
# SANITISE ASCII ART BLOCKS (convert Unicode to ASCII for pdflatex)
# ──────────────────────────────────────────────────────────────────────────────
_BOX_MAP = str.maketrans({
    '└': '+', '├': '+', '┤': '|', '┬': '+', '┴': '+', '┼': '+',
    '─': '-', '╌': '-', '╍': '-', '┄': '-', '┈': '-',
    '│': '|', '╎': '|', '┆': '|', '┊': '|',
    '┌': '+', '┐': '+', '┘': '+',
    '╲': chr(92), '╱': '/', '═': '=', '║': '|', '╔': '+', '╗': '+',
    '╚': '+', '╝': '+', '╠': '+', '╣': '+', '╦': '+', '╩': '+', '╬': '+',
    '●': '*', '■': '#', '▓': '#', '░': '.', '█': '#',
    '✓': 'OK', '✅': 'OK', '→': '->', '←': '<-', '↑': '^', '↓': 'v',
    '≈': '~', '≤': '<=', '≥': '>=', '×': 'x', '·': '.', '±': '+/-',
    '’': "'", '‘': "'", '“': '"', '”': '"',
    '—': '--', '–': '-', '…': '...',
    'α': 'alpha', 'β': 'beta', 'γ': 'gamma', 'δ': 'delta',
    'λ': 'lambda', 'μ': 'mu', 'π': 'pi', 'σ': 'sigma',
    'τ': 'tau', 'φ': 'phi', 'ω': 'omega',
})

def sanitise_code_block(text: str) -> str:
    """Convert Unicode chars in ASCII art to plain ASCII for pdflatex."""
    return text.translate(_BOX_MAP)


def tex_escape(text: str) -> str:
    """Escape a plain-text string for LaTeX (no math/code inside)."""
    global _SAVES
    _SAVES = []

    # 1) protect display math  $$ ... $$
    text = _protect(text, r'\$\$[\s\S]*?\$\$')
    # 2) protect inline math  $ ... $  (not starting with digit/space → not dollar amount)
    text = _protect(text, r'\$(?![0-9,\s])(?:[^$\n]|\n(?!\n))+?\$')
    # 3) protect inline code  `...`
    text = _protect(text, r'`[^`\n]+`')

    # 4) escape bare special chars
    text = text.replace('%', r'\%')
    text = text.replace('&', r'\&')
    text = text.replace('#', r'\#')
    # underscore: escape only when not already preceded by backslash
    text = re.sub(r'(?<!\\)_', r'\\_', text)
    # dollar signs remaining (dollar amounts like $50)
    text = text.replace('$', r'\$')

    # 5) unicode → LaTeX
    for ch, rep in _UNICODE.items():
        text = text.replace(ch, rep)
    for ch, rep in _GREEK.items():
        text = text.replace(ch, rep)

    # 6) restore protected spans, converting inline code to \texttt{}
    def _rst(m):
        saved = _SAVES[int(m.group(1))]
        if saved.startswith('`') and saved.endswith('`'):
            inner = saved[1:-1]
            inner = inner.replace('%', r'\%').replace('$', r'\$').replace('&', r'\&').replace('#', r'\#').replace('_', r'\_')
            return r'\texttt{' + inner + '}'
        return saved  # math: return verbatim
    text = re.sub(r'\x00SAVE(\d{4})\x00', _rst, text)

    return text


def apply_inline(text: str) -> str:
    """Apply **bold**, *italic*, ~~strikethrough~~ to already-escaped text."""
    # Protect math spans so that _ inside $...$ / $$...$$ is not treated as italic
    _ai_saves: list = []
    def _ai_protect(m):
        idx = len(_ai_saves)
        _ai_saves.append(m.group(0))
        return f'\x00AI{idx:04d}\x00'
    text = re.sub(r'\$\$[\s\S]*?\$\$', _ai_protect, text)
    text = re.sub(r'\$[^$\n]+\$', _ai_protect, text)

    # bold (must come before italic)
    text = re.sub(r'\*\*(.+?)\*\*', r'\\textbf{\1}', text)
    text = re.sub(r'__(.+?)__', r'\\textbf{\1}', text)
    # italic
    text = re.sub(r'\*(.+?)\*', r'\\textit{\1}', text)
    text = re.sub(r'_(.+?)_', r'\\textit{\1}', text)

    # Restore protected math
    def _ai_restore(m):
        return _ai_saves[int(m.group(1))]
    text = re.sub(r'\x00AI(\d{4})\x00', _ai_restore, text)
    return text


def process_text(text: str) -> str:
    """Full pipeline: escape then apply inline markup."""
    return apply_inline(tex_escape(text))


# ──────────────────────────────────────────────────────────────────────────────
# TABLE CONVERSION
# ──────────────────────────────────────────────────────────────────────────────
def convert_table(rows: list[str]) -> str:
    """Convert a list of '| a | b | c |' strings to a LaTeX longtable."""
    parsed = []
    for row in rows:
        row = row.strip()
        if not row.startswith('|'):
            continue
        cells = [c.strip() for c in row.split('|')[1:-1]]
        parsed.append(cells)

    if not parsed:
        return ''

    # Remove separator rows (only dashes/colons)
    filtered = [r for r in parsed if not all(re.match(r'^[-:]+$', c) for c in r)]
    if not filtered:
        return ''

    ncols = max(len(r) for r in filtered)

    # Build column spec: first col 'l', rest 'Y' (raggedright X)
    col_spec = 'l' + 'Y' * (ncols - 1) if ncols > 1 else 'Y'

    out = ['', r'\begin{table}[H]', r'\centering', r'\small',
           r'\begin{tabularx}{\linewidth}{' + col_spec + '}',
           r'\toprule']

    for i, row in enumerate(filtered):
        # pad/trim to ncols
        while len(row) < ncols:
            row.append('')
        row = row[:ncols]
        cells = [process_text(c) for c in row]
        out.append(' & '.join(cells) + r' \\')
        if i == 0:
            out.append(r'\midrule')

    out += [r'\bottomrule', r'\end{tabularx}', r'\end{table}', '']
    return '\n'.join(out)


# ──────────────────────────────────────────────────────────────────────────────
# LIST CONVERSION
# ──────────────────────────────────────────────────────────────────────────────
def convert_list_block(lines: list[str]) -> str:
    """Convert a block of list lines to LaTeX itemize/enumerate."""
    if not lines:
        return ''
    # Detect ordered vs unordered by first item
    first = lines[0].strip()
    ordered = bool(re.match(r'^\d+\.', first))
    env = 'enumerate' if ordered else 'itemize'
    out = [f'\\begin{{{env}}}']
    for line in lines:
        m = re.match(r'^(\s*)([-*+]|\d+\.)\s+(.*)', line)
        if m:
            out.append(r'\item ' + process_text(m.group(3)))
        else:
            # continuation line
            if out[-1].startswith(r'\item'):
                out[-1] += ' ' + process_text(line.strip())
    out.append(f'\\end{{{env}}}')
    return '\n'.join(out)


# ──────────────────────────────────────────────────────────────────────────────
# BLOCKQUOTE / RESEARCH BOX CONVERSION
# ──────────────────────────────────────────────────────────────────────────────
RESEARCH_KEYS = ('Researchers:', 'Year:', 'Research question:', 'Research Question:',
                 'Method:', 'Results:', 'Economic interpretation:', 'Behavioural insight:',
                 'Economic Interpretation:', 'Behavioural Insight:')

def convert_blockquote(lines: list[str]) -> str:
    """Convert > lines to researchbox or quote."""
    # Strip the leading '> ' from each line
    stripped = []
    for ln in lines:
        ln = ln.strip()
        if ln.startswith('> '):
            stripped.append(ln[2:])
        elif ln == '>':
            stripped.append('')
        else:
            stripped.append(ln)

    full_text = '\n'.join(stripped)

    # Is this a research study box?
    is_research = (
        re.search(r'\*\*Research Study', full_text) or
        re.search(r'\*\*Researchers:', full_text) or
        any(f'**{k}' in full_text for k in RESEARCH_KEYS)
    )

    if is_research:
        return convert_research_box(stripped)
    else:
        # Regular blockquote
        body = '\n'.join(process_text(ln) for ln in stripped if ln)
        return r'\begin{quote}' + '\n' + body + '\n' + r'\end{quote}'


def convert_research_box(lines: list[str]) -> str:
    """Convert stripped research study lines to researchbox environment."""
    box_lines = [r'\begin{researchbox}']

    for ln in lines:
        ln = ln.strip()
        if not ln:
            box_lines.append('')
            continue
        # Remove leading markdown bold '**Key:**' format
        m = re.match(r'^\*\*(.+?)\*\*\s*(.*)', ln)
        if m:
            key = m.group(1).rstrip(':')
            val = m.group(2).strip()
            if val:
                box_lines.append(r'\textbf{' + key + ':} ' + process_text(val) + r'\\[4pt]')
            else:
                box_lines.append(r'\textbf{' + key + r'}\\[4pt]')
        else:
            box_lines.append(process_text(ln))

    box_lines.append(r'\end{researchbox}')
    return '\n'.join(box_lines)


# ──────────────────────────────────────────────────────────────────────────────
# SECTION COMMAND MAPPING
# ──────────────────────────────────────────────────────────────────────────────
_END_MATTER = {
    'chapter overview', 'learning objectives', 'introduction',
    'critical thinking questions', 'review questions', 'chapter summary',
    'glossary', 'references',
}

def section_cmd(level: int, title: str, is_chapter_title=False) -> str:
    """Return appropriate \section (or *) command for heading level."""
    clean = title.strip()
    safe = process_text(clean)
    base = clean.lower().split(':')[0].strip()

    # The chapter title line (#) → already handled in title_page; skip
    if level == 1 or is_chapter_title:
        return ''  # handled separately

    # Check if this is an end-matter section (unnumbered)
    in_end_matter = any(base.startswith(k) for k in _END_MATTER)

    if level == 2:
        if in_end_matter:
            return (r'\section*{' + safe + r'}' + '\n' +
                    r'\addcontentsline{toc}{section}{' + safe + r'}')
        return r'\section{' + safe + r'}'

    if level == 3:
        if in_end_matter:
            return r'\subsubsection*{' + safe + r'}'
        return r'\subsection{' + safe + r'}'

    if level >= 4:
        return r'\subsubsection{' + safe + r'}'

    return r'\paragraph{' + safe + r'}'


# ──────────────────────────────────────────────────────────────────────────────
# MAIN CONVERSION STATE MACHINE
# ──────────────────────────────────────────────────────────────────────────────
def convert_md(md_text: str, ch_num: str, ch_long_title: str) -> str:
    lines = md_text.splitlines()
    output: list[str] = []

    state = 'NORMAL'
    buffer: list[str] = []

    def flush_buffer():
        nonlocal state, buffer
        if not buffer:
            return
        if state == 'CODE':
            output.append(r'\begin{lstlisting}[caption={}]')
            output.extend(sanitise_code_block(line) for line in buffer)
            output.append(r'\end{lstlisting}')
        elif state == 'TABLE':
            output.append(convert_table(buffer))
        elif state == 'BLOCKQUOTE':
            output.append(convert_blockquote(buffer))
        elif state == 'LIST':
            output.append(convert_list_block(buffer))
        elif state == 'PARA':
            output.append(process_text(' '.join(buffer)))
        buffer = []

    i = 0
    while i < len(lines):
        line = lines[i]
        raw = line

        # ── CODE BLOCK ────────────────────────────────────────────────────────
        if state == 'CODE':
            if raw.strip() == '```' or raw.strip().startswith('```') and len(raw.strip()) == 3:
                flush_buffer()
                state = 'NORMAL'
            else:
                buffer.append(raw)
            i += 1
            continue

        if raw.strip().startswith('```'):
            # flush whatever was accumulating
            flush_buffer()
            state = 'CODE'
            buffer = []
            i += 1
            continue

        # ── BLANK LINE ────────────────────────────────────────────────────────
        if raw.strip() == '':
            flush_buffer()
            state = 'NORMAL'
            output.append('')
            i += 1
            continue

        # ── HORIZONTAL RULE ──────────────────────────────────────────────────
        if re.match(r'^---+$', raw.strip()):
            flush_buffer()
            state = 'NORMAL'
            output.append(r'\medskip')
            i += 1
            continue

        # ── HEADING ──────────────────────────────────────────────────────────
        hm = re.match(r'^(#{1,6})\s+(.*)', raw)
        if hm:
            flush_buffer()
            state = 'NORMAL'
            level = len(hm.group(1))
            title = hm.group(2).strip()
            # Strip trailing *** or ---
            title = re.sub(r'\s*---+$', '', title)
            cmd = section_cmd(level, title)
            if cmd:
                output.append('')
                output.append(cmd)
                output.append('')
            i += 1
            continue

        # ── TABLE ─────────────────────────────────────────────────────────────
        if raw.strip().startswith('|'):
            if state != 'TABLE':
                flush_buffer()
                state = 'TABLE'
            buffer.append(raw)
            i += 1
            continue
        elif state == 'TABLE':
            flush_buffer()
            state = 'NORMAL'

        # ── BLOCKQUOTE ────────────────────────────────────────────────────────
        if raw.startswith('>'):
            if state != 'BLOCKQUOTE':
                flush_buffer()
                state = 'BLOCKQUOTE'
            buffer.append(raw)
            i += 1
            continue
        elif state == 'BLOCKQUOTE':
            flush_buffer()
            state = 'NORMAL'

        # ── LIST ──────────────────────────────────────────────────────────────
        if re.match(r'^\s*([-*+]|\d+\.)\s+', raw):
            if state != 'LIST':
                flush_buffer()
                state = 'LIST'
            buffer.append(raw)
            i += 1
            continue
        elif state == 'LIST':
            # Check if it's a continuation (indented)
            if raw.startswith('  ') or raw.startswith('\t'):
                buffer.append(raw)
                i += 1
                continue
            flush_buffer()
            state = 'NORMAL'

        # ── NORMAL PARAGRAPH ──────────────────────────────────────────────────
        if state == 'NORMAL':
            state = 'PARA'
            buffer = [raw.strip()]
        elif state == 'PARA':
            buffer.append(raw.strip())

        i += 1

    flush_buffer()

    return '\n'.join(output)


# ──────────────────────────────────────────────────────────────────────────────
# CHAPTER METADATA EXTRACTION
# ──────────────────────────────────────────────────────────────────────────────
def extract_chapter_meta(md_text: str):
    """Return (chapter_number_str, full_title, short_header)."""
    for line in md_text.splitlines():
        line = line.strip()
        if line.startswith('# Chapter'):
            # '# Chapter 9: Choice Architecture — Nudges and Libertarian Paternalism'
            m = re.match(r'^#\s+Chapter\s+(\d+)\s*[:\-—]\s*(.*)', line)
            if m:
                num = m.group(1)
                title = m.group(2).strip()
                # Short header: 'Chapter 9: [short title]'
                short = title.split('—')[0].strip().split(':')[0].strip()
                header = f'Chapter {num}: {short}'
                return num, title, header
        elif line.startswith('# '):
            # Generic: '# Beyond Rationality: ...'
            title = line[2:].strip()
            header = title[:50]
            return '?', title, header
    return '?', 'Untitled', 'ECON 230 Chapter'


# ──────────────────────────────────────────────────────────────────────────────
# POST-PROCESS: FIX COMMON ISSUES
# ──────────────────────────────────────────────────────────────────────────────
def post_process(tex: str) -> str:
    """Clean up known conversion artifacts."""
    # Remove \\_  that ended up inside already-LaTeX-escaped sequences like \beta\_1
    # (These arise when β_1 is in math mode - already protected, so this shouldn't happen)

    # Fix doubled backslash-escape at end of table rows: \\ \\ → \\
    tex = re.sub(r'\\\\\s*\\\\', r'\\\\', tex)

    # Remove stray \medskip after section headings
    tex = re.sub(r'(\\(?:sub)*section\*?\{[^}]*\})\n+\\medskip', r'\1', tex)

    # Ensure no empty tabularx cells that could cause alignment issues
    tex = re.sub(r'& &', r'& {} &', tex)

    # Fix "Looking Ahead" and similar end-of-chapter dividers → keybox
    tex = re.sub(
        r'\\textbf\{Looking Ahead\.\}(.*?)(?=\n\n)',
        lambda m: r'\begin{keybox}' + '\n' + r'\textbf{Looking Ahead.}' + m.group(1) + '\n' + r'\end{keybox}',
        tex, flags=re.DOTALL
    )
    tex = re.sub(
        r'\\textbf\{End of Textbook\.\}(.*?)(?=\n\n)',
        lambda m: r'\begin{keybox}' + '\n' + r'\textbf{End of Textbook.}' + m.group(1) + '\n' + r'\end{keybox}',
        tex, flags=re.DOTALL
    )

    return tex


# ──────────────────────────────────────────────────────────────────────────────
# FULL FILE GENERATION
# ──────────────────────────────────────────────────────────────────────────────
def convert_file(md_path: str) -> str:
    with open(md_path, encoding='utf-8') as f:
        md_text = f.read()

    ch_num, ch_title, ch_header = extract_chapter_meta(md_text)
    print(f'  Processing Chapter {ch_num}: {ch_title[:60]}...')

    preamble = make_preamble(ch_header)
    title_page = make_title_page(ch_num, ch_title)
    body = convert_md(md_text, ch_num, ch_title)
    body = post_process(body)
    body = final_tex_sanitise(body)

    doc = (
        preamble + '\n'
        r'\begin{document}' + '\n\n'
        + title_page + '\n'
        + body + '\n\n'
        + r'\end{document}' + '\n'
    )
    return doc


# ──────────────────────────────────────────────────────────────────────────────

# ──────────────────────────────────────────────────────────────────────────────
# FINAL SANITISE: fix stray chars outside lstlisting
# ──────────────────────────────────────────────────────────────────────────────
def final_tex_sanitise(tex: str) -> str:
    """Handle any remaining problematic chars outside lstlisting blocks.
    Accented Latin chars (ä é ü ö ï) are fine in T1/lmodern — leave them.
    """
    import re
    # Outside lstlisting: replace remaining math-like unicode chars
    _outer_map = {
        '≈': r'$\approx$', '−': '-', '—': '---', '–': '--',
        '≤': r'$\leq$', '≥': r'$\geq$', '≠': r'$\neq$',
        '×': r'$\times$', '·': r'$\cdot$', '∞': r'$\infty$',
        '→': r'$\rightarrow$', '←': r'$\leftarrow$',
        '↑': r'$\uparrow$', '↓': r'$\downarrow$',
        '±': r'$\pm$', '°': r'$^{\circ}$',
        '…': r'\ldots{}', '\u2019': "'", '\u2018': '`',
        '\u201c': '``', '\u201d': "''", '\xa0': '~',
    }

    # Split on lstlisting blocks to avoid touching code blocks
    parts = re.split(r'(\\begin\{lstlisting\}.*?\\end\{lstlisting\})', tex, flags=re.DOTALL)
    result = []
    for i, part in enumerate(parts):
        if i % 2 == 1:  # lstlisting block — leave alone
            result.append(part)
        else:
            for ch, rep in _outer_map.items():
                part = part.replace(ch, rep)
            result.append(part)
    return ''.join(result)

# ENTRY POINT
# ──────────────────────────────────────────────────────────────────────────────
def main():
    md_files = sorted(
        f for f in os.listdir(TEXTBOOK_DIR)
        if f.startswith('ECON230_Textbook_Chapter_') and f.endswith('.md')
    )

    if not md_files:
        print('No chapter .md files found in', TEXTBOOK_DIR)
        sys.exit(1)

    print(f'Found {len(md_files)} markdown chapters. Converting...\n')

    for md_file in md_files:
        md_path = os.path.join(TEXTBOOK_DIR, md_file)
        tex_file = md_file.replace('.md', '.tex')
        tex_path = os.path.join(TEXTBOOK_DIR, tex_file)

        try:
            tex_content = convert_file(md_path)
            with open(tex_path, 'w', encoding='utf-8') as f:
                f.write(tex_content)
            print(f'  -> Written: {tex_file}  ({len(tex_content):,} chars)\n')
        except Exception as e:
            print(f'  ERROR converting {md_file}: {e}')
            import traceback; traceback.print_exc()

    print('Done. All .tex files written to:', TEXTBOOK_DIR)


if __name__ == '__main__':
    main()
